require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Socialproject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Raven.configure do |config|
  config.dsn = 'https://00c95779de3e4f04a995a9b021763c80:1135598eeb7d444a985dc48e6ea9c674@sentry.io/1205790'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
