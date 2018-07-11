class CreateEventTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :event_talks do |t|
      t.references :event, foreign_key: true
      t.references :talk, foreign_key: true

      t.timestamps
    end
  end
end
