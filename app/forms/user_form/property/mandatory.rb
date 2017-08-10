module UserForm
  module Property
    module Mandatory
      include Reform::Form::Module
      include UserForm::Property::Password

      property :email

      validates :email, presence: true, unique: true
      validates :email, format: { with: Devise.email_regexp }
    end
  end
end
