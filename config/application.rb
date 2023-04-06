require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SkateShop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
   # config.autoload_paths << "#{root}/app/helpers"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("lib")

    # This is a public sample test API key.
    # Don’t submit any personally identifiable information in requests made with this key.
    # Sign in to see your own test API key embedded in code samples.
    Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

    # autoload lib folder
    config.autoload_paths << Rails.root.join('lib')
  end
end
