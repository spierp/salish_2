class AddColumnsToMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :status
    remove_column :memberships, :invited_by
  end
end
