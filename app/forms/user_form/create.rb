module UserForm
  class Create < ApplicationForm::Base
    include UserForm::Property::Mandatory

    delegate :active_for_authentication?, :inactive_message, :is_a?, to: :model

    property :profile do
      property :nickname

      validates :nickname, presence: true
    end

    validates :profile, presence: true

    def prepopulate!
      self.profile = Profile.new
    end
  end
end
