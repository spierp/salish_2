class Membership < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :tribe
  attr_accessible :name, :tribe_id, :user_id, :invited_by, :status, :tribeuser
  
  before_validation :set_tribeuser
  
  validates_uniqueness_of :tribeuser 
  
  
  private
    def set_tribeuser
      self.tribeuser = "#{self.user_id}_#{self.tribe_id}"
    end
    
end
