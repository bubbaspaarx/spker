class ChangeTableColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :about, :text
  end
end
