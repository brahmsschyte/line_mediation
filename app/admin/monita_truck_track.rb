ActiveAdmin.register MonitaTruckTrack do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :tracking_id
    column :annotation
    column :time_id
    column :retrieved
    actions
  end

  filter :tracking_id
  filter :annotation
  filter :time_id
  filter :retrieved
end
