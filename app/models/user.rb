class User < ActiveRecord::Base
   
  mount_uploader :image, ImageUploader 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
  include Devise::Async::Model

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :image
  validates_presence_of :first_name, :last_name
  # attr_accessible :title, :body
  
  has_many :memberships
  has_many :tribes, :through => :memberships

end
