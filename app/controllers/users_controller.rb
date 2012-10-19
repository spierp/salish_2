class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.admin?
    @users = User.paginate(page: params[:page])
    else redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user or current_user.admin?
    else redirect_to root_path
    end
  end
  
end
  
    