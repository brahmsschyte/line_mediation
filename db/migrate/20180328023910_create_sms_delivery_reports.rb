class CreateSmsDeliveryReports < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_delivery_reports do |t|
      t.string :msisdn
      t.string :trx_id
      t.string :trx_stat
      t.string :status
      t.boolean :retrieved

      t.timestamps
    end
  end
end
