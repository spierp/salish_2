class User < ActiveRecord::Base
   
  mount_uploader :image, ImageUploader 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
#  include Devise::Async::Model

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :image, :tribe_invite, :memberships_attributes, :admin, :invitation_limit
  
  scope :order_by, lambda { |o| {:order => o} }  

  validates_presence_of :first_name, :last_name
  # attr_accessible :title, :body
  
  has_many :memberships, :dependent => :destroy
  has_many :tribes, :through => :memberships
  has_many :owned, :class_name => "Tribe", :foreign_key => "owner_id"
  accepts_nested_attributes_for :memberships

  def combined_name
    "#{self.first_name} #{self.last_name}"
  end

end
