class CreateLineEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :line_events do |t|
      t.jsonb    :event
      t.boolean  :retrieved
      t.references :line_bot

      t.timestamps
    end
  end
end
