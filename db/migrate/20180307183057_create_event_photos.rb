class CreateEventPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :event_photos do |t|
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
