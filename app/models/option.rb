class Option < ActiveRecord::Base
  
  belongs_to :accessory
  has_many :line_items
   attr_accessor :option_selection
  
  def color_size
    self.color + ' | ' + self.size + ' | ' + self.quantity.to_s + ' in stock'
  end
end
