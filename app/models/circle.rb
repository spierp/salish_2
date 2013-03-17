class Circle < ActiveRecord::Base
  
  def to_param
      privatelink
  end
  
  attr_accessible :privatelink, :tribe_id
  validates :privatelink, uniqueness: true, presence: true

  
  belongs_to :tribe
  
  private
  before_validation(:on => :create) do 
    self.privatelink = SecureRandom.urlsafe_base64(n = 8)
  end
  
end
