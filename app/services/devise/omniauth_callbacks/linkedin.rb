module Devise
  module OmniauthCallbacks
    class Linkedin < ::ApplicationService::Base
      def call
        find_user!

        return user if user.present?

        create_user!
      end

      private

      attr_reader :user

      delegate :info, :extra, :uid, to: :params
      delegate :raw_info,           to: :extra

      delegate :email, :first_name, :last_name, :nickname, :image, to: :info

      def find_user!
        @user = User.find_by_uid(params.extra.raw_info.sub)
      end

      def create_user!
        @user = UserForm::CreateSocial.new(built_user.decorate)

        user.skip_confirmation!
        user.save

        user.model
      end

      def built_user
        @built_user ||= User.new(user_attributes)
      end

      def user_attributes
        @user_attributes ||= {
          email:    email,
          password: Devise.friendly_token[0, 20],
          provider: :linkedin,
          uid:      uid,
          profile_attributes: {
            first_name: first_name,
            last_name:  last_name,
            nickname:   nickname,
            avatar:     image_file
          }
        }
      end

      def image_file
        open(image) if image.present?
      end
    end
  end
end
