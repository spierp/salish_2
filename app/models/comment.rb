class Comment < ActiveRecord::Base
  attr_accessible :emoti, :post_id, :text, :user_id
  
  belongs_to :post
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
