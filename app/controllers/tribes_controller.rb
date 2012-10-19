class TribesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tribe = Tribe.new
  end

  def index
    if current_user.admin?
    @tribes = Tribe.paginate(page: params[:page])
    else redirect_to root_path
    end
  end

  def show
    @tribe = Tribe.find(params[:id])
  end
  
  def create
    @tribe = current_user.tribes.build(params[:tribe])
    if @tribe.save
      flash[:success] = "Tribe started!"
      redirect_to root_path
    else    
      render 'new'
    end
  end
  
end