class AddAdsIdToSmsDeliveryReports < ActiveRecord::Migration[5.1]
  def change
    add_column :sms_delivery_reports, :ads_id, :integer
  end
end
