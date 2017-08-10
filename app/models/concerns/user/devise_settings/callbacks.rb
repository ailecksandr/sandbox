class User
  module DeviseSettings
    module Callbacks
      extend ActiveSupport::Concern

      included do
        def after_confirmation
          self.update(role: User::ADMIN_ROLE) if User.confirmed.exists?
        end
      end
    end
  end
end
