class CirclesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @circle = Circle.new
    @tribes = current_user.tribes.order_by('name ASC').collect {|x| [x.name, x.id] }
  end
  
  def show
    @circle = Circle.find_by_privatelink!(params[:id])
  end
  
  def create
    @circle = Circle.new(params[:circle])
    if @circle.save
      flash[:success] = "circle created!"
      redirect_to posts_path
    else    
      render 'new'
    end
  end  
  
end  