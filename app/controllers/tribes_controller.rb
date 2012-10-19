class TribesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tribe = Tribe.new
  end

  def index
    @tribes = Tribe.paginate(page: params[:page])
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

  def join
      @tribe = Tribe.find(params[:id])
      @m = @tribe.memberships.build(:user_id => current_user.id)
      respond_to do |format|
        if @m.save
          format.html { redirect_to(@tribe, :notice => 'You have joined this group.') }
          format.xml  { head :ok }
        else
          format.html { redirect_to(@tribe, :notice => 'Join error.') }
          format.xml  { render :xml => @tribe.errors, :status => :unprocessable_entity }
        end
      end
    end

end