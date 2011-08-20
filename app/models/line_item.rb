class LineItem < ActiveRecord::Base
  
  belongs_to :workshop
  belongs_to :frame_model
  belongs_to :frame_model_size
  belongs_to :component_package
  belongs_to :bottom_bracket, :class_name => 'Components::BottomBracket'
  belongs_to :front_brake, :class_name => 'Components::FrontBrake'
  belongs_to :accessory
  belongs_to :gear
  belongs_to :top_tube_style
  belongs_to :order
  belongs_to :bottom_bracket, :class_name => 'Components::BottomBracket'
  belongs_to :front_brake, :class_name => 'Components::FrontBrake'
  belongs_to :rear_brake, :class_name => 'Components::RearBrake'
  belongs_to :chain, :class_name => 'Components::Chain'
  belongs_to :chainring, :class_name => 'Components::Chainring'
  belongs_to :cog, :class_name => 'Components::Cog'
  belongs_to :crank, :class_name => 'Components::Crank'
  belongs_to :fork, :class_name => 'Components::Fork'
  belongs_to :grip, :class_name => 'Components::Grip'
  belongs_to :half_link, :class_name => 'Components::HalfLink'
  belongs_to :handlebar, :class_name => 'Components::Handlebar'
  belongs_to :headset, :class_name => 'Components::Headset'
  belongs_to :front_lever, :class_name => 'Components::FrontLever'
  belongs_to :rear_lever, :class_name => 'Components::RearLever'
  belongs_to :pedal, :class_name => 'Components::Pedal'
  belongs_to :rim_strip, :class_name => 'Components::RimStrip'
  belongs_to :saddle, :class_name => 'Components::Saddle'
  belongs_to :seat_clamp, :class_name => 'Components::SeatClamp'
  belongs_to :seat_post, :class_name => 'Components::SeatPost'
  belongs_to :stem, :class_name => 'Components::Stem'
  belongs_to :front_tire, :class_name => 'Components::FrontTire'
  belongs_to :rear_tire, :class_name => 'Components::RearTire'
  belongs_to :front_tube, :class_name => 'Components::FrontTube'
  belongs_to :rear_tube, :class_name => 'Components::RearTube'
  belongs_to :front_wheel, :class_name => 'Components::FrontWheel'
  belongs_to :rear_wheel, :class_name => 'Components::RearWheel'
  
  def self.new_reservation_based_on(workshop)
    line_item = self.new
    line_item.workshop = workshop
    line_item.quantity = 1
    line_item.price = workshop.price
    return line_item
  end
  
  def self.new_frame_model_based_on(frame_model, frame_model_size, workshop, gear, top_tube_style)
    line_item = self.new
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.workshop = workshop
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.quantity = 1
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
    return line_item
  end
  
  def self.new_kit_based_on(frame_model, frame_model_size, gear, top_tube_style)
    line_item = self.new
    line_item.frame_model = frame_model
    line_item.frame_model_size = frame_model_size
    line_item.gear = gear
    line_item.top_tube_style = top_tube_style
    line_item.quantity = 1
    line_item.price = (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
    return line_item
  end
  
  def self.new_component_package_based_on(component_package, frame_model, frame_model_size)
    line_item = self.find{|line| (line.frame_model == frame_model.id) && (line.frame_model_size == frame_model_size.id)}
    line_item.component_package = component_package
    line_item.frame_model = frame_model
    line_item.price += component_package.price
    return line_item
  end
  
  def self.new_component_based_on(component, name)
    line_item = self.new
    if name == 'bottom_bracket'
      line_item.bottom_bracket = component
    elsif name == 'front_brake'
      line_item.front_brake = component
    elsif name == 'rear_brake'
     line_item.rear_brake = component
    elsif name == 'chain'
      line_item.chain = component
    elsif name == 'chainring'
      line_item.chainring = component    
    elsif name == 'cog'
      line_item.cog = component    
    elsif name == 'crank'
      line_item.crank = component    
    elsif name == 'fork'
      line_item.fork = component    
    elsif name == 'grip'
      line_item.grip = component    
    elsif name == 'half_link'
      line_item.half_link = component    
    elsif name == 'handlebar'
      line_item.handlebar = component    
    elsif name == 'headset'
      line_item.headset = component    
    elsif name == 'front_lever'
      line_item.front_lever = component    
    elsif name == 'rear_lever'
      line_item.rear_lever = component    
    elsif name == 'pedal'
      line_item.pedal = component    
    elsif name == 'rim_strip'
      line_item.rim_strip = component    
    elsif name == 'saddle'
      line_item.saddle = component    
    elsif name == 'seat_clamp'
      line_item.seat_clamp = component    
    elsif name == 'seat_post'
      line_item.seat_post = component    
    elsif name == 'stem'
      line_item.stem = component    
    elsif name == 'front_tire'
      line_item.front_tire = component    
    elsif name == 'rear_tire'
      line_item.rear_tire = component    
    elsif name == 'front_tube'
      line_item.front_tube = component    
    elsif name == 'rear_tube'
      line_item.rear_tube = component    
    elsif name == 'front_wheel'
      line_item.front_wheel = component    
    elsif name == 'rear_wheel'
      line_item.rear_wheel = component          
    end
    line_item.quantity = 1
    line_item.price = component.price
    return line_item
  end

  def self.new_accessory_based_on(accessory)
    line_item = self.new
    line_item.accessory = accessory
    line_item.quantity = 1
    line_item.price = accessory.price
    return line_item
  end
  

  
  def self.remove_reservation_based_on(workshop)
    line_item = self.find(workshop)
    line_item.workshop = workshop
    line_item.quantity = 1
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
    line_item.quantity = 1
    line_item.price = component_package.price
    return line_item
  end
  
  def self.remove_component_based_on(component, name)
    line_item = self.find(component)
    if name == 'bottom_bracket'
      line_item.bottom_bracket = component
    elsif name == 'front_brake'
      line_item.front_brake = component
    elsif name == 'rear_brake'
     line_item.rear_brake = component
    elsif name == 'chain'
      line_item.chain = component
    elsif name == 'chainring'
      line_item.chainring = component    
    elsif name == 'cog'
      line_item.cog = component    
    elsif name == 'crank'
      line_item.crank = component    
    elsif name == 'fork'
      line_item.fork = component    
    elsif name == 'grip'
      line_item.grip = component    
    elsif name == 'half_link'
      line_item.half_link = component    
    elsif name == 'handlebar'
      line_item.handlebar = component    
    elsif name == 'headset'
      line_item.headset = component    
    elsif name == 'front_lever'
      line_item.front_lever = component    
    elsif name == 'rear_lever'
      line_item.rear_lever = component    
    elsif name == 'pedal'
      line_item.pedal = component    
    elsif name == 'rim_strip'
      line_item.rim_strip = component    
    elsif name == 'saddle'
      line_item.saddle = component    
    elsif name == 'seat_clamp'
      line_item.seat_clamp = component    
    elsif name == 'seat_post'
      line_item.seat_post = component    
    elsif name == 'stem'
      line_item.stem = component    
    elsif name == 'front_tire'
      line_item.front_tire = component    
    elsif name == 'rear_tire'
      line_item.rear_tire = component    
    elsif name == 'front_tube'
      line_item.front_tube = component    
    elsif name == 'rear_tube'
      line_item.rear_tube = component    
    elsif name == 'front_wheel'
      line_item.front_wheel = component    
    elsif name == 'rear_wheel'
      line_item.rear_wheel = component          
    end
    line_item.quantity = 1
    line_item.price = component.price
    return line_item
  end
  
  def self.remove_accessory_based_on(accessory)
    line_item = self.find(accessory)
    line_item.accessory = accessory
    line_item.quantity = 1
    line_item.price = accessory.price
    return line_item
  end
  
end
