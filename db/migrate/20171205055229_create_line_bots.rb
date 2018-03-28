class CreateLineBots < ActiveRecord::Migration[5.1]
  def change
    create_table :line_bots do |t|
      t.string  :app_name
      t.string  :app_description
      t.string  :channel_id
      t.string  :channel_secret
      t.string  :channel_access_token
      t.string  :api_key

      t.timestamps
    end

    add_index :line_bots, :api_key, unique: true
  end
end
