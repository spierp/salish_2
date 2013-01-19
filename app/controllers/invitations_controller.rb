class InvitationsController < Devise::InvitationsController
  # GET /resource/invitation/new
    def new
      build_resource
      1.times { resource.memberships.build }
      render :new
    end
end