# Load the Rails application.
require_relative "application"
if Rails.env.development?
  Rails.application.configure do
    
    config.web_console.allowed_ips = []
  
  end
end
# Initialize the Rails application.
Rails.application.initialize!
