# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DefaultRailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :uk
    config.generators do |g|
      g.helper false
      g.javascripts false
      g.stylesheets false
      g.test false
      g.template_engine :erb
      g.test_framework :rspec,
          fixtures: false,
          view_specs: false,
          helper_specs: false,
          routing_specs: false,
          controller_specs: false,
          request_specs: false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
