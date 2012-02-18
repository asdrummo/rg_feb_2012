# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Drummlins::Application.initialize!
Paperclip::Attachment.default_options[:command_path] = "/opt/local/bin/"

module ActiveSupport::Inflector
  # does the opposite of humanize.... mostly. Basically does a
  # space-substituting .underscore
  def computerize(the_string)
    result = the_string.to_s.dup
    result.downcase.gsub(/ +/,'_')
  end
end

class String
  def computerize
    ActiveSupport::Inflector.computerize(self)
  end
end