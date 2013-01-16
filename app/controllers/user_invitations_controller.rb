class UserInvitationsController < Devise::InvitationsController
  def new
      build_resource
      1.times { resource.memberships.build }
    end
end