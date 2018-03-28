class CreateMogiTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :mogi_tracks do |t|
      t.string :android_id
      t.string :serial
      t.string :annotation
      t.float  :altitude
      t.float  :speed
      t.float  :accuracy
      t.float  :latitude
      t.float  :longitude
      t.datetime :time_id
      t.boolean  :retrieved

      t.timestamps
    end
  end
end
