require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Sandbox
  class Application < Rails::Application
    config.load_defaults(5.1)

    config.time_zone                      = secrets.time_zone
    config.active_record.default_timezone = :local

    config.generators.system_tests = nil
  end
end
