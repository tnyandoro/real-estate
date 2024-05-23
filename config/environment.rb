# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.middleware.use Utf8Sanitizer