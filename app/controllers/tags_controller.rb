class TagsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if current_user == @user
      @photos = @user.photos
    else
      redirect_to new_user_session_path
    end
  end
end
