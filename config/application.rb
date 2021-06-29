# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
require_relative 'env_variables'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Socialnetwork
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.add_autoload_paths_to_load_path = false
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    ActionMailer::Base.smtp_settings = {
      address: 'smtp.sendgrid.net',
      authentication: :plain,
      domain: 'www.api.com',
      enable_starttls_auto: true,
      password: ENV['SENDGRID_API_KEY'],
      port: 587,
      user_name: ENV['SENDGRID_USERNAME']
    }
    config.action_mailer.default_url_options = { host: ENV['SERVER_URL'],
                                                 port: ENV['SERVER_PORT'] }
    config.action_mailer.default_options = {
      from: 'no-reply@api.com'
    }
      end
end
