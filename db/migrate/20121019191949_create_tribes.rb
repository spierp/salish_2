class CreateTribes < ActiveRecord::Migration
  def change
    create_table :tribes do |t|

      t.timestamps
    end
  end
end
