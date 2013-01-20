class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @tribes = current_user.tribes.order_by('name ASC').collect {|x| [x.name, x.id] }
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user or current_user.admin?
    else redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Membership Updated"
      redirect_to users_path
    else  
      render 'new'
    end  
  end
  
end
  
    