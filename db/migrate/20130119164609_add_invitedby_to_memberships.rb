class AddInvitedbyToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :invited_by, :integer
  end
end
