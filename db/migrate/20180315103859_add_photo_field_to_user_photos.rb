class AddPhotoFieldToUserPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :user_photos, :photo, :string
  end
end
