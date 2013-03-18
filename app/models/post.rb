class Post < ActiveRecord::Base
  
  mount_uploader :attachment, AttachmentUploader
  mount_uploader :image, ImageUploader  
  
  attr_accessible :attachment, :circle_id, :text, :tribe_id, :user_id, :attachment_filesize, :attachment_filetype, :image
  belongs_to :user
  belongs_to :tribe
  has_many :comments
  
  before_save :update_attachment_attributes
  
  default_scope order: 'posts.created_at DESC'
  
  def default_name
    self.name ||= File.basename(attachment.filename, '.*').titleize if attachment
  end
  
  private

    def update_attachment_attributes
      if attachment.present? && attachment_changed?
        self.attachment_filetype = attachment.file.content_type
        self.attachment_filesize = attachment.file.size
      end
    end
  
  
end