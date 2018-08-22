class CreateMonitaTruckTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :monita_truck_tracks do |t|
      t.datetime :time_id
      t.float :latitude
      t.float :longitude
      t.float :altitude
      t.float :speed
      t.float :accuracy
      t.string :annotation
      t.string :tracking_id
      t.boolean :retrieved

      t.timestamps
    end
  end
end
