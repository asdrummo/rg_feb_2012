class Workshop < ActiveRecord::Base
  has_many :line_items
  
  
  validates_presence_of :client_id
  validates_presence_of :experience
end
