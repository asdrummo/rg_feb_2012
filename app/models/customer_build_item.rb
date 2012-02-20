class CustomerBuildItem < ActiveRecord::Base
belongs_to :customer_build
belongs_to :workshop
belongs_to :frame_model
belongs_to :custom_frame_model
belongs_to :frame_model_size
belongs_to :component_package
belongs_to :component
belongs_to :custom_component
belongs_to :accessory
belongs_to :gear
belongs_to :top_tube_style
belongs_to :option

  
  def self.new_frame_based_on(frame, frame_size, gear, top_tube_style)
    line_item = self.new
    line_item.frame_model = frame
    line_item.frame_model_size = frame_size
    line_item.component_type = 'Frame'
    line_item.compartment = 'Frame'
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    #line_item.client_id = frame.client_id
    line_item.price = (frame.price + frame_size.price + gear.price + top_tube_style.price)
    return line_item
  end

  def self.new_custom_frame_based_on(frame, gear)
    line_item = self.new
    line_item.component_type = 'Frame'
    line_item.compartment = 'Frame'
    line_item.gear = gear
    line_item.custom_frame_model = frame
    return line_item
  end

  def self.new_build_component_based_on(component)
   line_item = self.new
   line_item.component = component
   #line_item.component_id = component.component_id
   line_item.component_type = component.component_type
   line_item.compartment = component.compartment
   #line_item.client_id = component.client_id
   line_item.price = component.price
   return line_item
  end
  
  def self.new_build_custom_component_based_on(component)
   line_item = self.new
   line_item.custom_component = component
   #line_item.component_id = component.component_id
   line_item.component_type = component.component_type
   line_item.compartment = component.compartment
   #line_item.client_id = component.client_id
   return line_item
  end


end