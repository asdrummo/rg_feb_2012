class LineItem < ActiveRecord::Base
  
  belongs_to :workshop
  belongs_to :frame_model
  belongs_to :frame_model_size
  belongs_to :component_package
  belongs_to :component
  belongs_to :accessory
  belongs_to :gear
  belongs_to :top_tube_style
  belongs_to :order
  belongs_to :option
  @status = "processing"
  
  
  def self.new_workshop_based_on(workshop)
    line_item = self.new
    line_item.workshop = workshop
    line_item.quantity = 1
    line_item.client_id = workshop.client_id
    line_item.status = @status
    return line_item
  end
  
  def self.new_frame_model_based_on(frame_model, frame_model_size, workshop, gear, top_tube_style)
    line_item = self.new
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.workshop = workshop
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.client_id = frame_model.client_id
    line_item.status = @status
    line_item.quantity = 1
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
    return line_item
  end
  
  def self.add_frame_model_to_workshop(frame_model, workshop)
     line_item = self.new
     line_item.workshop = workshop
     line_item.frame_model = frame_model
     line_item.client_id = workshop.client_id
     line_item.status = @status
     return line_item
  end
  
  def self.new_kit_based_on(frame_model, frame_model_size, gear, top_tube_style)
    line_item = self.new
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.quantity = 1
    line_item.client_id = frame_model.client_id
    line_item.status = @status
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
    return line_item
  end
  
  def self.new_component_package_based_on(component_package, frame_model, frame_model_size)
    line_item = self.find{|line| (line.frame_model == frame_model.id) && (line.frame_model_size == frame_model_size.id)}
    line_item.component_package = component_package
    line_item.frame_model = frame_model
    line_item.client_id = component_package.client_id
    line_item.status = @status
    line_item.price += component_package.price
    return line_item
  end
  
 
  
  def self.new_component_based_on(component)
    line_item = self.new
    line_item.component = component
    line_item.quantity = 1
    line_item.client_id = component.client_id
    line_item.status = @status
    line_item.price = component.price
    return line_item
  end

  def self.new_accessory_based_on(accessory, option)
    line_item = self.new
    line_item.accessory = accessory
    line_item.option = option
    line_item.quantity = 1
    line_item.client_id = accessory.client_id
    line_item.status = @status
    line_item.price = accessory.price
    return line_item
  end
  

  
  def self.remove_reservation_based_on(workshop)
    line_item = self.find(workshop)
    line_item.workshop = workshop
    line_item.quantity = 1
    line_item.client_id = workshop.client_id
    line_item.status = @status
    line_item.price = workshop.price
    return line_item
  end
  
  def self.remove_frame_model_based_on(frame_model, frame_model_size, workshop, gear, top_tube_style)
    line_item = self.find(frame_model)
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.workshop = workshop
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.client_id = frame_model.client_id
    line_item.status = @status
    line_item.quantity = 1
    if line_item.component_package
      line_item.component_package = line_item.component_package.price
    else
      line_item.component_package = 0
    end
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price + line_item.component_package.price)
    return line_item
  end
  
  def self.remove_kit_based_on(frame_model, frame_model_size, gear, top_tube_style)
    line_item = self.find(frame_model)
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.client_id = frame_model.client_id
    line_item.status = @status
    line_item.quantity = 1
    if line_item.component_package
      line_item.component_package = line_item.component_package.price
    else
      line_item.component_package = 0
    end
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price + line_item.component_package.price)
    return line_item
  end
  
  def self.remove_component_package_based_on(component_package, frame_model)
    line_item = self.find(component_package)
    line_item.component_package = component_package
    line_item.client_id = component_package.client_id
    line_item.status = @status
    line_item.quantity = 1
    line_item.price = component_package.price
    return line_item
  end
  
  def self.remove_component_based_on(component)
    line_item = self.find(component)
    line_item.component = component
    line_item.client_id = component.client_id
    line_item.status = @status
    line_item.quantity = 1
    line_item.price = component.price
    return line_item
  end
  
  def self.remove_accessory_based_on(accessory, option)
    line_item = self.find(accessory)
    line_item.accessory = accessory
    line_item.client_id = accessory.client_id
    line_item.status = @status
    line_item.quantity = 1
    line_item.price = accessory.price
    return line_item
  end
  
end
