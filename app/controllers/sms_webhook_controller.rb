class SmsWebhookController < ApplicationController
  protect_from_forgery with: :null_session

  def callback # from/to cyclops
    unless is_validate_signature
      head :bad_request
    end

    SmSenderWorker.perform_async(sms_params[:msisdn], sms_params[:content], sms_params[:ads_id])

    head :ok
  end

  def delivery_report # from/to tsel smsc
    @sms = SmsDeliveryReport.find_by(trx_id: delivery_report_params[:trxid])
    @sms.update(status: delivery_report_params[:status]) unless @sms.blank?

    head :ok
  end

  private

  def sms_params
    params.permit(:content, :ads_id, msisdn: [])
  end

  def delivery_report_params
    params.permit(:trxid, :status)
  end

  def is_validate_signature
    params[:key] == secrets[:sms_key]
  end
end
