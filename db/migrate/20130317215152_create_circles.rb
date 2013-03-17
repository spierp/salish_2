class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :tribe_id
      t.string :privatelink

      t.timestamps
    end
  end
end
