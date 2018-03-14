class ChangePostcodeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :postcode, :string
  end
end
