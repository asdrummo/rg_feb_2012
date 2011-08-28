# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Drummlins::Application.initialize!
Paperclip::Attachment.default_options[:command_path] = "/opt/local/bin/"


