class Tribe < ActiveRecord::Base
  attr_accessible :name, :tribe_id, :user_id
  has_many :memberships
  has_many :users, :through => :memberships
  
end
