class SmSenderWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :myqueue, :retry => false, :backtrace => true

  def perform(msisdns, content, ads_id)
    msisdns.each do |n|
      uri = URI(secrets.sms_url)
      par = { :cp_name => secrets.sms_cp_name, :pwd => secrets.sms_pwd, :msisdn => n, :sms => content }
      uri.query = URI.encode_www_form(par)

      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        res_body = res.body.strip.split(':')
        SmsDeliveryReport.create(msisdn: n, trx_id: res_body[1], trx_stat: res_body[0], status: content, retrieved: false, ads_id: ads_id)
      end
    end
  end

  private

  def secrets
    @secrets = Rails.application.secrets
  end
end
