module Devise
  module Registrations
    class ChangePassword < ::ApplicationService::FormService
      form_class UserForm::ChangePassword
    end
  end
end
