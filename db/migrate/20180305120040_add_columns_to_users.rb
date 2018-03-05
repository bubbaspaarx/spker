class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_speaker, :boolean
    add_column :users, :address, :text
    add_column :users, :postcode, :text
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
