ActiveAdmin.register LineBot do
  permit_params :app_name, :app_description, :channel_id, :channel_secret, :channel_access_token

  index do
    selectable_column
    id_column
    column :app_name
    column :app_description
    column :updated_at
    actions
  end

  filter :app_name
  filter :app_description

  form do |f|
    f.inputs do
      f.input :app_name
      f.input :app_description
    end
    f.actions
  end
end
