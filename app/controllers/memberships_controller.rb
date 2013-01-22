class MembershipsController < ApplicationController
before_filter :authenticate_user!
  
  def new
    @membership = Membership.new
  end
  
  def index
    if current_user.admin?
      @memberships = Membership.all
    else 
      redirect_to root_path
    end  
  end  
  

  def create
    @membership = Membership.create(params[:membership])
    @tribe = @membership.tribe
    if current_user.id == @tribe.owner_id
      @membership.status = "approved"
    else
      @membership.status = "pending"  
    end  
    if @membership.save
      if @membership.status == "approved"
        flash[:notice] = "Membership saved."
      else @membership.status == "pending"
        flash[:notice] = "Invitation sent.  Please ask your cheif to welcome this new member to the tribe." 
      end     
      redirect_to tribes_path
    else
      flash[:error] = "Unable to invite.  Maybe this user is already a member of your tribe?"
      redirect_to :back
    end
  end

  def destroy
    @membership = Membership.find(params[:id]).destroy
    flash[:notice] = "Membership removed."
    redirect_to memberships_path
  end
  
  def update
    @membership = Membership.find(params[:id])
    if @membership.update_attributes(params[:membership])
      flash[:success] = "Membership Updated"
      redirect_to :back
    else  
      render :back
    end  
  end
  
end
