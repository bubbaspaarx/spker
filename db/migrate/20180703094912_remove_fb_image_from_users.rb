class RemoveFbImageFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fb_image, :string
  end
end
