class AddFirstnameToComment < ActiveRecord::Migration
  def change
    add_column :comments, :first_name, :string
  end
end
