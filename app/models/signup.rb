class Signup < ActiveRecord::Base
  attr_accessible :email
  
  EMAIL_REGEX = /^[A-ZA-Z0-9._%+-]+@[A-ZA-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :email, :presence => true, :length => {:maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true, :uniqueness => true  
end
