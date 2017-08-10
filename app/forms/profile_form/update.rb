module ProfileForm
  class Update < ApplicationForm::Base
    delegate :avatar, :avatar_file_name, to: :model,        prefix: true, allow_nil: true
    delegate :url,                       to: :model_avatar, prefix: true, allow_nil: true
    delegate :user,                      to: :model

    property :nickname
    property :first_name
    property :last_name
    property :phone
    property :avatar

    validates :nickname, length: { in: 3..16 }
    validates :avatar, file_content_type: { allow: IMAGE_TYPES }
  end
end
