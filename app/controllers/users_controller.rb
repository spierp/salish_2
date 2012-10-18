class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user == current_user
    else redirect_to root_path
    end
  end
end
  
    