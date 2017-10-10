# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

RAILS_ENV = “production”
RACK_ENV = “production”
RAILS_LOG_TO_STDOUT = “enabled”
RAILS_SERVE_STATIC_FILES = “enabled”