class SmsWebhookController < ApplicationController
  protect_from_forgery with: :null_session

  def callback # from/to cyclops
    unless is_validate_signature
      head :bad_request
    end

    sms_params[:msisdn].each do |n|
      uri = URI(secrets.sms_url)
      par = { :cp_name => secrets.sms_cp_name, :pwd => secrets.sms_pwd, :msisdn => n, :sms => sms_params[:content] }
      uri.query = URI.encode_www_form(par)

      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        res_body = res.body.strip.split(':')
        SmsDeliveryReport.create(msisdn: n, trx_id: res_body[1], trx_stat: res_body[0], status: sms_params[:content])
      end
    end

    head :ok
  end

  def delivery_report # from/to tsel smsc
    @sms = SmsDeliveryReport.find_by(trx_id: delivery_report_params[:trxid])
    @sms.update(status: delivery_report_params[:status]) unless @sms.blank?

    head :ok
  end

  private

  def sms_params
    params.permit(:content, msisdn: [])
  end

  def delivery_report_params
    params.permit(:trxid, :status)
  end

  def secrets
    @secrets = Rails.application.secrets
  end

  def is_validate_signature
    params[:key] == secrets[:sms_key]
  end
end
