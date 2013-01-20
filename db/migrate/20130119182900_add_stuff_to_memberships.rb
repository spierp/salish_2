class AddStuffToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :invited_by, :integer
    add_column :memberships, :status, :string, :default => "approved"
  end
end
