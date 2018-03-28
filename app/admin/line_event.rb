ActiveAdmin.register LineEvent do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :retrieved
    column :line_bot
    column :updated_at
    actions
  end

  filter :retrieved
  filter :line_bot
  filter :updated_at
end
