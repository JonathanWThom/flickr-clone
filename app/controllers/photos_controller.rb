class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(image: photo_params[:image], owner_id: current_user.id)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
