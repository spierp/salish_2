class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :tribe_id
      t.integer :circle_id      
      t.string :attachment
      t.text :text

      t.timestamps
    end
  end
end
