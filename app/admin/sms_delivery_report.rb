ActiveAdmin.register SmsDeliveryReport do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :msisdn
    column :trx_id
    column :trx_stat
    column :updated_at
    actions
  end

  filter :msisdn
  filter :trx_id
  filter :trx_stat
  filter :updated_at
end
