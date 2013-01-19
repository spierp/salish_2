class Tribe < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  attr_accessible :name, :tribe_id, :user_id, :image, :owner_id
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :members, :through => :memberships, :source => :user
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  
  scope :order_by, lambda { |o| {:order => o} }  
  
end
