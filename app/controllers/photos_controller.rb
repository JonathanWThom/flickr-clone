class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @comment = @photo.comments.new
    if params[:favorite] == '1'
      @photo.liked_by current_user
      redirect_to user_photo_path(@user, @photo)
    end

    if params[:favorite] == '-1'
      @photo.disliked_by current_user
      redirect_to user_photo_path(@user, @photo)
    end

    @comments = @photo.comments
  
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

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_photos_path(current_user)
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end

  def tag_params
    params.require(:photo).permit({user_ids: []})
  end
end
