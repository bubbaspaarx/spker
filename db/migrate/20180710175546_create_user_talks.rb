class CreateUserTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_talks do |t|
      t.references :user, foreign_key: true
      t.references :talk, foreign_key: true

      t.timestamps
    end
  end
end
