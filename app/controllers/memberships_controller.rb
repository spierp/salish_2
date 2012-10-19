class MembershipsController < ApplicationController
before_filter :authenticate_user!
  
  def new
    @membership = Membership.new
  end


  def create
    @membership = current_user.memberships.build(params[:membership])
    if @membership.save
      flash[:notice] = "You have joined this group."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
    flash[:notice] = "Removed membership."
        redirect_to :back
  end
  
end
