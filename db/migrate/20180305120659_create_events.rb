class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :postcode
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
