class PhotosController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @user = User.find(params[:user_id])
    @photos = Photo.where(owner_id: @user.id)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(image: photo_params[:image], owner_id: current_user.id)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
