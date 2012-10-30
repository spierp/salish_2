class Membership < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :tribe
  attr_accessible :name, :tribe_id, :user_id

end
