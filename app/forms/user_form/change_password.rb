module UserForm
  class ChangePassword < ApplicationForm::Base
    include UserForm::Property::Password

    delegate :profile, :valid_password?, to: :model

    validate :current_password_match?

    private

    def current_password_match?
      return true if valid_password?(current_password) && current_password.present?

      errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    end
  end
end
