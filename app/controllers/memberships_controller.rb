class MembershipsController < ApplicationController
before_filter :authenticate_user!
  
  def new
    @membership = Membership.new
  end
  

  def create
    @membership = Membership.create(params[:membership])
    if @membership.save
      flash[:notice] = "Membership saved."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  def destroy
    @membership = user.memberships.find(params[:id]).destroy
    flash[:notice] = "Removed membership."
    redirect_to root_path
  end
  
end
