ActiveAdmin.register MogiTrack do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :android_id
    column :serial
    column :annotation
    column :latitude
    column :longitude
    column :time_id
    column :retrieved
    actions
  end

  filter :android_id
  filter :serial
  filter :annotation
  filter :time_id
  filter :retrieved
end
