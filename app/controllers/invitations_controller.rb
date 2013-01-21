class InvitationsController < Devise::InvitationsController
  # GET /resource/invitation/new
    def new
      build_resource
      1.times { resource.memberships.new }
      @tribes = current_user.tribes.order_by('name ASC').collect {|x| [x.name, x.id] }
      render :new
    end
    
end