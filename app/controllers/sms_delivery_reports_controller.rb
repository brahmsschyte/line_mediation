class SmsDeliveryReportsController < ApplicationController
  after_action :set_retrieved_flag, only: [:index]

  def index
    @sms = SmsDeliveryReport.where(retrieved: false)

    respond_to do |format|
      format.json
    end
  end

  private

  def set_retrieved_flag
    @sms.update_all(retrieved: true)
  end
end
