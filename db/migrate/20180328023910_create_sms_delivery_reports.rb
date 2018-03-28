class CreateSmsDeliveryReports < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_delivery_reports do |t|
      t.string :trx_id
      t.string :status

      t.timestamps
    end
  end
end
