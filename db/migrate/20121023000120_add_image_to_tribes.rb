class AddImageToTribes < ActiveRecord::Migration
  def change
    add_column :tribes, :image, :string
  end
end
