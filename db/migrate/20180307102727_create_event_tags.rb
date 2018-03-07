class CreateEventTags < ActiveRecord::Migration[5.1]
  def change
    create_table :event_tags do |t|
      t.references :event, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
