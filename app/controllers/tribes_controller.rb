class TribesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tribe = Tribe.new
  end

  def index
      if current_user.admin?
      @tribes = Tribe.paginate(page: params[:page])
      else
      @tribes = current_user.tribes.paginate(page: params[:page])
      end
  end

  def show
    @tribe = Tribe.find(params[:id])
#    if @tribe.users << current_user
#      redirect_to @tribe
#    else
#      redirect_to root_path
#    end
  end
  
  def create
    @tribe = current_user.tribes.build(params[:tribe])
    @tribe.users << current_user
    @tribe.owner_id = current_user.id
    if @tribe.save
      flash[:success] = "Tribe started!"
      redirect_to @tribe
    else    
      render 'new'
    end
  end

  def join
      @tribe = Tribe.find(params[:id])
      @m = @tribe.memberships.build(:user_id => current_user.id)
        if @m.save
          flash[:success] = "Tribe started!"
          redirect_to root_path
        else
          render 'new'
      end
    end


  def destroy
    @tribe = Tribe.find(params[:id]).destroy
    flash[:success] = "Tribe destroyed"
    redirect_to tribes_path
  end

end