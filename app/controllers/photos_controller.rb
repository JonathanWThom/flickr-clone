class PhotosController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
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

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(user_ids: tag_params[:user_ids])
        redirect_to user_photo_path(current_user, @photo)
    else
      flash[:notice] = "Error"
      redirect_to user_photo_path(current_user, @photo)
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end

  def tag_params
    params.require(:photo).permit({user_ids: []})
  end
end
