class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
