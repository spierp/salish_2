class AddTribeuserToememberships < ActiveRecord::Migration
  def up
    add_column :memberships, :tribeuser, :string
  end

  def down
    remove_column :memberships, :tribeuser
  end
end
