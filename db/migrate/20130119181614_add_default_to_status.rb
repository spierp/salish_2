class AddDefaultToStatus < ActiveRecord::Migration
  def change
    remove_column :memberships, :status
    add_column :memberships, :status, :string, :default => 'approved'
  end
end
