# Load the Rails application.
require_relative "application"

Rails.application.configure do

  config.web_console.allowed_ips = []

end
# Initialize the Rails application.
Rails.application.initialize!
