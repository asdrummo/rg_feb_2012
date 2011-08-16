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
  
  def add_reservation( workshop )
    existing_item = @items.find {|item| item.workshop_id == workshop.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_reservation_based_on(workshop)
      
    end
    @total_price += workshop.price
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
  
  def add_kit( frame_model, frame_model_size, gear, top_tube_style )
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.gear_id == gear.id) && (item.top_tube_style == top_tube_style.id)}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_kit_based_on(frame_model, frame_model_size, gear, top_tube_style)
    end
    @total_price += (frame_model.price + frame_model_size.price + gear.price + top_tube_style.price)
  end
  
  def add_component( component )
    existing_item = @items.find {|item| item.component_id == component.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_component_based_on(component)
      
    end
    @total_price += component.price
  end
  
  def add_component_package( component_package, frame_model, frame_model_size )
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id)}
    if existing_item
      existing_item.component_package =  component_package
      existing_item.price += component_package.price
    else
      @item.frame_model << LineItem.new_component_package_based_on(component_package, frame_model)
      
    end
    @total_price += component_package.price
  end
  
  def add_accessory( accessory )
    existing_item = @items.find {|item| item.accessory_id == accessory.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_accessory_based_on(accessory)
      
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
    existing_item = @items.find {|item| (item.frame_model_id == frame_model.id) && (item.frame_model_size_id == frame_model_size.id) && (item.workshop_id == workshop.id) && (item.gear_id == gear.id)}
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