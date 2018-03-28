ActiveAdmin.register SmsDeliveryReport do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :trx_id
    column :status
    column :updated_at
    actions
  end

  filter :trx_id
  filter :status
  filter :updated_at
end
