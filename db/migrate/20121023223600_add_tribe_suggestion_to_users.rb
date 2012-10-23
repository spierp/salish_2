class AddTribeSuggestionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tribe_invite, :string
  end
end
