class AddNameToTribes < ActiveRecord::Migration
  def change
    add_column :tribes, :name, :string
  end
end
