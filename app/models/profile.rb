class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  has_attached_file :avatar, default_url: MISSING_AVATAR_FILE_NAME
  validates_attachment_content_type :avatar, content_type: IMAGE_TYPES
end
