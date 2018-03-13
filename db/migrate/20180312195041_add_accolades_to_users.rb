class AddAccoladesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accolades, :text
  end
end
