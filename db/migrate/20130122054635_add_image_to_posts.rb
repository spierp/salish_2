class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string
    add_column :posts, :attachment_filetype, :string
    add_column :posts, :attachment_filesize, :decimal
  end
end
