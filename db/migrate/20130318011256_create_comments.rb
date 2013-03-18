class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :text
      t.string :emoti

      t.timestamps
    end
  end
end
