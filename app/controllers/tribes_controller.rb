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
  
  def edit
    @tribe = Tribe.find(params[:id])
    if current_user.id == @tribe.owner_id
    elsif current_user.admin?
    else redirect_to root_path
    end  
    @tribemembers = @tribe.members.order_by('first_name ASC').collect {|x| [x.combined_name, x.id] }
  end
  
  def create
    @tribe = current_user.tribes.build(params[:tribe])
    @tribe.users << current_user
    @tribe.owner_id = current_user.id
    if @tribe.save
      flash[:success] = "Tribe started!"
      redirect_to tribes_path
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

  def update
    @tribe = Tribe.find(params[:id])
    if @tribe.update_attributes(params[:tribe])
      flash[:success] = "Tribe Updated"
      redirect_to tribes_path
    else  
      render 'edit'
    end  
  end


  def destroy
    @tribe = Tribe.find(params[:id]).destroy
    flash[:success] = "Tribe destroyed"
    redirect_to tribes_path
  end

end