module UserForm
  class CreateSocial < ApplicationForm::Base
    include UserForm::Property::Mandatory

    delegate :skip_confirmation!, to: :model

    property :profile do
      property :nickname
      property :avatar

      validates :nickname, presence: true
      validates :avatar, file_content_type: { allow: IMAGE_REGEXP }
    end

    validates :profile, presence: true

    def prepopulate!
      self.profile = Profile.new
    end
  end
end
