module Devise
  module Registrations
    class ResourceBuilder < ::ApplicationService::Base
      def initialize(params = {})
        @params   = params[:params]
        @resource = params[:resource]
      end

      def call
        set_form!

        return resource if params.blank?

        validate!
      end

      private

      attr_reader :resource

      def set_form!
        @resource = UserForm::Create.new(User.new.decorate)

        resource.prepopulate!
      end

      def validate!
        resource.validate(params)

        resource
      end
    end
  end
end
