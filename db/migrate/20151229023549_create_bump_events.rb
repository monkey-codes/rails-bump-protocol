class CreateBumpEvents < ActiveRecord::Migration
  def change
    create_table :bump_events do |t|
      t.string :device_id
      t.st_point :lonlat, :geographic => true

      t.timestamps null: false
    end
    add_index :bump_events, :lonlat, using: :gist
  end
end
