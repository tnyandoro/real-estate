require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReazSchoolApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.encoding = "utf-8"
    # Add the UTF-8 sanitizer middleware
    config.autoload_paths += %W(#{config.root}/lib)
    # config.middleware.use Utf8Sanitizer

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                headers: :any,
                methods: %i[get post put patch delete options head]
      end
    end
  end
end
