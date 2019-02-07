class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :speaker_about, :text
    add_column :users, :post_nominal, :string
    add_column :users, :country, :string
    add_column :users, :vat_reg, :boolean
    add_column :users, :vat_num, :integer
  end
end
