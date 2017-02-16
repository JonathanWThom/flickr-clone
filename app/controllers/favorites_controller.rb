class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to '/' unless current_user == User.find(params[:user_id])
  end
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.find_liked_items
  end

end
