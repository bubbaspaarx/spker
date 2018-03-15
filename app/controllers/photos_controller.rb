class PhotosController < ApplicationController
  def new
    @photo = UserPhoto.new
  end

  def create
    @photo = UserPhoto.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html {redirect_to root}
      else
        # errors later
      end
    end
  end

  def photo_params
    params.require(:photos).permit(:photo, :photo_cache)
  end
end
