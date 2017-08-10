module UserForm
  module Property
    module Password
      include Reform::Form::Module

      property :password
      property :password_confirmation, empty: true
      property :current_password,      virtual: true

      validates :password, confirmation: true, length: PASSWORD_MIN_SIZE..PASSWORD_MAX_SIZE
    end
  end
end
