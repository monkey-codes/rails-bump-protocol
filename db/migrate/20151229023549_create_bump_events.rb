class CreateBumpEvents < ActiveRecord::Migration
  def change
    create_table :bump_events do |t|
      t.string :device_id
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps null: false
    end
  end
end
