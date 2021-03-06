require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Uxzero
  class Application < Rails::Application
    config.application_naked_domain = 'uxzero.com'
    config.application_domain = 'https://uxzero.com'
    config.application_name = 'UXZero'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.exceptions_app = self.routes
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.to_prepare do
      Devise::Mailer.layout 'mailer'
    end
    Raven.configure do |config|
      config.dsn = 'https://3add7b55c033417d9ea66f98f0333e7b:2223e91af2604d9fb43252bc453dd3de@sentry.io/1509642'
    end

  end
end
