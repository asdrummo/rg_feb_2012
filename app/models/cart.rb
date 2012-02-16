class Cart
  
  attr_reader :items
  attr_reader :total_price
  
  def initialize
    empty_all_items
  end
  
  def empty_all_items
    @items = []
    @total_price = 0.0
  end
  
  def add_workshop( workshop )
    existing_item = @items.find {|item| item.workshop_id == workshop.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_workshop_based_on(workshop)
      
    end
  end
  
  def add_frame_model( frame_model, frame_model_size, workshop, gear, top_tube_style )
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.workshop_id == workshop.id) && (item.gear_id == gear.id) && (item.top_tube_style == top_tube_style.id)}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_frame_model_based_on(frame_model, frame_model_size, workshop, gear, top_tube_style)
     
    end
    @total_price += (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
  end
  
  def add_frame_model_to_workshop( frame_model, workshop)

       @items << LineItem.add_frame_model_to_workshop( frame_model, workshop )

  end
  
    
  def add_kit( frame_model, frame_model_size, gear, top_tube_style )
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id) && (item.top_tube_style == top_tube_style.id)}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_kit_based_on(frame_model, frame_model_size, gear, top_tube_style)
    end
    @total_price += (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
  end
  
  def add_component(component)
    existing_item = @items.find {|item| item.component_id == component.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_component_based_on(component)
    end
    @total_price += component.price
  end
  
  def find_existing_item(component, name)
    if name == "bottom_bracket"
    @existing_item = @items.find {|item| (item.bottom_bracket_id == component.id)}
    elsif name == "front_brake"
    @existing_item = @items.find {|item| (item.front_brake_id == component.id)}
    elsif name == 'rear_brake'
      @existing_item = @items.find {|item| (item.rear_brake_id == component.id)}
    elsif name == 'chain'
      @existing_item = @items.find {|item| (item.chain_id == component.id)}
    elsif name == 'chainring'
      @existing_item = @items.find {|item| (item.chainring_id == component.id)}
    elsif name == 'cog'
      @existing_item = @items.find {|item| (item.cog_id == component.id)}
    elsif name == 'crank'
      @existing_item = @items.find {|item| (item.crank_id == component.id)}
    elsif name == 'front_derailleur'
      @existing_item = @items.find {|item| (item.front_derailleur_id == component.id)}
    elsif name == 'rear_derailleur'
      @existing_item = @items.find {|item| (item.rear_derailleur_id == component.id)}
    elsif name == 'fork'
      @existing_item = @items.find {|item| (item.fork_id == component.id)}
    elsif name == 'grip'
      @existing_item = @items.find {|item| (item.grip_id == component.id)}
    elsif name == 'half_link'
      @existing_item = @items.find {|item| (item.half_link_id == component.id)}
    elsif name == 'handlebar'
      @existing_item = @items.find {|item| (item.handlebar_id == component.id)}
    elsif name == 'headset'
      @existing_item = @items.find {|item| (item.headset_id == component.id)}
    elsif name == 'front_lever'
      @existing_item = @items.find {|item| (item.front_lever_id == component.id)}
    elsif name == 'rear_lever'
      @existing_item = @items.find {|item| (item.rear_lever_id == component.id)}
    elsif name == 'pedal'
      @existing_item = @items.find {|item| (item.pedal_id == component.id)}
    elsif name == 'rim_strip'
      @existing_item = @items.find {|item| (item.rim_strip_id == component.id)}
    elsif name == 'saddle'
      @existing_item = @items.find {|item| (item.saddle_id == component.id)}
    elsif name == 'seat_clamp'
      @existing_item = @items.find {|item| (item.seat_clamp_id == component.id)}
    elsif name == 'seat_post'
      @existing_item = @items.find {|item| (item.seat_post_id == component.id)}
    elsif name == 'front_shifter'
      @existing_item = @items.find {|item| (item.front_shifter_id == component.id)}
    elsif name == 'rear_shifter'
      @existing_item = @items.find {|item| (item.rear_shifter_id == component.id)}
    elsif name == 'stem'
      @existing_item = @items.find {|item| (item.stem_id == component.id)}
    elsif name == 'front_tire'
      @existing_item = @items.find {|item| (item.front_tire_id == component.id)}
    elsif name == 'rear_tire'
      @existing_item = @items.find {|item| (item.rear_tire_id == component.id)}
    elsif name == 'front_tube'
      @existing_item = @items.find {|item| (item.front_tube_id == component.id)}
    elsif name == 'rear_tube'
      @existing_item = @items.find {|item| (item.rear_tube_id == component.id)}
    elsif name == 'front_wheel'
      @existing_item = @items.find {|item| (item.front_wheel_id == component.id)}
    elsif name == 'rear_wheel'
      @existing_item = @items.find {|item| (item.rear_wheel_id == component.id)}
    end
  end
  
  def add_component_package( component_package, frame_model, frame_model_size )
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id)}
    if existing_item
      existing_item.component_package =  component_package
      existing_item.price += component_package.price
    else
      @item.frame_model << LineItem.new_component_package_based_on(component_package, frame_model, frame_model_size)
      
    end
    @total_price += component_package.price
  end
  
  def add_accessory( accessory, option )
    existing_item = @items.find {|item| (item.accessory_id == accessory.id) && (item.option == option)}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_accessory_based_on(accessory, option)
      
    end
    @total_price += accessory.price
  end
  
  def add_accessory_no_option(accessory)
    existing_item = @items.find {|item| (item.accessory_id == accessory.id) }
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_accessory_no_option_based_on(accessory)
      
    end
    @total_price += accessory.price
  end
  
  def remove_reservation(workshop)
    existing_item = @items.find {|item| item.workshop_id == workshop.id}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
      
    end
    @total_price -= workshop.price
  end
  
  def remove_frame_model(frame_model, frame_model_size, workshop, gear, top_tube_style)
    if workshop != nil
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.workshop_id == workshop.id) && (item.gear_id == gear.id)}
    else
      existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id)}
    end
    
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
    end
    @total_price -= frame_model.price + frame_model_size.price + gear.price + top_tube_style.price 
  end
  
  def remove_kit(frame_model, frame_model_size, gear, top_tube_style)
    if workshop != nil
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id)}
    else
      existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id)}
    end
    
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
    end
    @total_price -= frame_model.price + frame_model_size.price + gear.price + top_tube_style.price 
  end
  
  def remove_frame_model_and_package(frame_model, frame_model_size, workshop, gear, top_tube_style, component_package )

    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.workshop_id == workshop.id) && (item.gear_id == gear.id) && (item.component_package_id == component_package.id)}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
    end
    @total_price -= frame_model.price + frame_model_size.price + gear.price + top_tube_style.price + component_package.price
  end
  
  def remove_kit_and_package(frame_model, frame_model_size, gear, top_tube_style, component_package )

    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id) && (item.component_package_id == component_package.id)}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
    end
    @total_price -= frame_model.price + frame_model_size.price + gear.price + top_tube_style.price + component_package.price
  end
  
  def remove_component_package(component_package, frame_model)
    existing_item = @items.find {|item| (item.component_package_id == component_package.id)}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
      
    end
    @total_price -= component_package.price
  end
  
  def remove_component(component)
    existing_item = @items.find {|item| item.component_id == component.id}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
      
    end
    @total_price -= component.price
  end
  
  def remove_accessory(accessory)
    existing_item = @items.find {|item| item.accessory_id == accessory.id}
    if existing_item && existing_item.quantity > 1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
      
    end
    @total_price -= accessory.price
  end
  
  
  
  
end