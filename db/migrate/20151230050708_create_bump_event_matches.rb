class CreateBumpEventMatches < ActiveRecord::Migration
  def change
    create_table :bump_event_matches do |t|
      t.references :bump_event, index: true, foreign_key: true
      t.references :matched_event, index: true
      t.timestamps null: false
    end

    add_foreign_key :bump_event_matches, :bump_events, column: :matched_event_id
    add_index :bump_event_matches, [:bump_event_id, :matched_event_id], unique: true
  end
end
