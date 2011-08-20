class PublicController < ApplicationController
  layout 'standard'
  before_filter :find_or_create_cart, :except => [:index]
  before_filter :find_or_create_customer, :only => [:checkout]
  
  def submit_component
      @component_name = params[:component]
      @id = params[:id]
      add_component_to_cart
      flash[:notice] = 'Item Added to Cart'
      redirect_to(:back)
  end
  
  def add_component_to_cart
    find_component
    @cart.add_component(@component, @name)
    session[:cart] = @cart
  end
  
  def find_component
    if @component_name == "Bottom Brackets"
    @component = Components::BottomBracket.find(@id)
    @name = "bottom_bracket"
    elsif @component_name == "Front Brakes"
      @component = Components::FrontBrake.find(@id)
      @name = "front_brake"
    elsif @component_name == 'Rear Brakes'
      @component = Components::RearBrake.find(@id)
      @name = "rear_brake"
    elsif @component_name == 'Chains'
      @component = Components::Chain.find(@id)
      @name = "chain"
    elsif @component_name == 'Chainrings'
      @component = Components::Chainring.find(@id)
      @name = "chainring"
    elsif @component_name == 'Cog Cassettes'
      @component = Components::Cog.find(@id)
      @name = "cog"
    elsif @component_name == 'Cranks'
      @component = Components::Crank.find(@id)
      @name = "crank"
    elsif @component_name == 'Forks'
      @component = Components::Fork.find(@id)
      @name = "fork"
    elsif @component_name == 'Grips'
      @component = Components::Grip.find(@id)
      @name = "grip"
    elsif @component_name == 'Half Links'
      @component = Components::HalfLink.find(@id)
      @name = "half_link"
    elsif @component_name == 'Handlebars'
      @component = Components::Handlebar.find(@id)
      @name = "handlebar"
    elsif @component_name == 'Headsets'
      @component = Components::Headset.find(@id)
      @name = "headset"
    elsif @component_name == 'Front Levers'
      @component = Components::FrontLever.find(@id)
      @name = "front_lever"
    elsif @component_name == 'Rear Levers'
      @component = Components::RearLever.find(@id)
      @name = "rear_lever"
    elsif @component_name == 'Pedals'
      @component = Components::Pedal.find(@id)
      @name = "pedal"
    elsif @component_name == 'Rim Strips'
      @component = Components::RimStrip.find(@id)
      @name = "rim_strip"
    elsif @component_name == 'Saddles'
      @component = Components::Saddle.find(@id)
      @name = "saddle"
    elsif @component_name == 'Seat Clamps'
      @component = Components::SeatClamp.find(@id)
      @name = "seat_clamp"
    elsif @component_name == 'Seat Posts'
      @component = Components::SeatPost.find(@id)
      @name = "seat_post"
    elsif @component_name == 'Stems'
      @component = Components::Stem.find(@id)
      @name = "stem"
    elsif @component_name == 'Front Tires'
      @component = Components::FrontTire.find(@id)
      @name = "front_tire"
    elsif @component_name == 'Rear Tires'
      @component = Components::RearTire.find(@id)
      @name = "rear_tire"
    elsif @component_name == 'Front Tubes'
      @component = Components::FrontTube.find(@id)
      @name = "front_tube"
    elsif @component_name == 'Rear Tubes'
      @component = Components::RearTube.find(@id)
      @name = "rear_tube"
    elsif @component_name == 'Front Wheels'
      @component = Components::FrontWheel.find(@id)
      @name = "front_wheel"
    elsif @component_name == 'Rear Wheels'
      @component = Components::RearWheel.find(@id)
      @name = "rear_wheel"
    end
  end
  
  def error_forbidden
    render('public/403')
  end
  
  def do_it_yourself
    @nav_id = 'do_it_yourself'
  end
  
  def bikes_to_buy
    @nav_id = 'bikes_to_buy'
  end
  
  def show_components
    @nav_id = 'show_components'
    @component = params[:type]
    load_components
    if request.xml_http_request?
      render :partial => 'public/partials/component',  :layout => false 
    end
  end
  
  def load_components
    if @component == 'Bottom Brackets'
      @components  = Components::BottomBracket.find(:all)
    elsif @component == 'Front Brakes'
      @components = Components::FrontBrake.find(:all)
    elsif @component == 'Rear Brakes'
      @components = Components::RearBrake.find(:all)
    elsif @component == 'Chains'
    @components = Components::Chain.find(:all)
    elsif @component == 'Chainrings'
      @components = Components::Chainring.find(:all)
    elsif @component == 'Cog Cassettes'
      @components = Components::Cog.find(:all)
    elsif @component == 'Cranks'
      @components = Components::Crank.find(:all)
    elsif @component == 'Forks'
      @components = Components::Fork.find(:all)
    elsif @component == 'Grips'
      @components = Components::Grip.find(:all)
    elsif @component == 'Half Links'
      @components = Components::HalfLink.find(:all)
    elsif @component == 'Handlebars'
      @components = Components::Handlebar.find(:all)
    elsif @component == 'Headsets'
      @components = Components::Headset.find(:all)
    elsif @component == 'Front Levers'
      @components = Components::FrontLever.find(:all)
    elsif @component == 'Rear Levers'
      @components = Components::RearLever.find(:all)
    elsif @component == 'Pedals'
      @components = Components::Pedal.find(:all)
    elsif @component == 'Rim Strips'
      @components = Components::RimStrip.find(:all)
    elsif @component == 'Saddles'
      @components = Components::Saddle.find(:all)
    elsif @component == 'Seat Clamps'
      @components = Components::SeatClamp.find(:all)
    elsif @component == 'Seat Posts'
      @components = Components::SeatPost.find(:all)
    elsif @component == 'Stems'
      @components = Components::Stem.find(:all)
    elsif @component == 'Front Tires'
      @components = Components::FrontTire.find(:all)
    elsif @component == 'Rear Tires'
      @components = Components::RearTire.find(:all)
    elsif @component == 'Front Tubes'
      @components = Components::FrontTube.find(:all)
    elsif @component == 'Rear Tubes'
      @components = Components::RearTube.find(:all)
    elsif @component == 'Front Wheels'
      @components = Components::FrontWheel.find(:all)
    elsif @component == 'Rear Wheels'
      @components = Components::RearWheel.find(:all)
    end
  end
  
  def reservations
    @workshops = Workshop.find(:all, :order => 'start_date ASC')
    @nav_id = 'do_it_yourself'
    @date = 'active_progress'
    render('reservations')
  end
  
  def submit_reservation
  add_reservation_to_cart
  session[:frame_model_size] = 'none'
  redirect_to(:action => 'show_models')
  end
  
  def show_models
    check_for_reservation
    check_for_size_error
    @frame_models = FrameModel.find(:all, :order => 'name ASC') 
    @nav_id = 'do_it_yourself'
    @model = 'active_progress'
    @frame_model_sizes = FrameModelSize.find(:all, :order => 'id ASC') 
    @top_tube_styles = TopTubeStyle.find(:all, :order => 'id ASC')
    @gears = Gear.find(:all, :order => 'id ASC')
    save_size
    save_top_tube
    save_gear
    if request.xml_http_request?
      render :partial => 'public/partials/models_table', :layout => false
    else

    end
  end
  
  def check_for_size_error
    if params[:size_error]
      @size_error = 'true'
    else
      @size_error = 'false'
    end
  end
  
  def save_size
    if params[:frame_model_size]
       session[:frame_model_size] = FrameModelSize.find(params[:frame_model_size]).name
       @size_selection = FrameModelSize.find(params[:frame_model_size]).name
    else
    @size_selection = "Select Size"
    end
  end
  
  def save_top_tube
    if params[:top_tube_selection]
       session[:top_tube_selection] = TopTubeStyle.find(params[:top_tube_selection])
    else
    @top_tube_selection = "Select Top Tube Style"
    end
  end 
  
  def save_gear
    if params[:gear_selection]
       session[:gear_selection] = Gear.find(params[:gear_selection])
    else
    @gear_selection = "Gears?"
    end
  end
  
  def submit_model

    if session[:frame_model_size] == 'none'
      redirect_to(:action => 'show_models', :size_error => 'true')
    else
      @size_error = 'false'
      add_frame_model_to_cart
      session[:workshop] = nil
      session[:top_tube_selection] = nil
      session[:frame_model] = @frame_model
      session[:gear] = session[:gear_selection]
      session[:gear_selection] = nil
      redirect_to(:action => 'show_component_packages')
    end
  end
  
  def submit_kit_model

    if session[:frame_model_size] == 'none'
      redirect_to(:action => 'bamboo_bike_kits', :size_error => 'true')
    else
      @size_error = 'false'
      add_kit_to_cart
      session[:workshop] = nil
      session[:top_tube_selection] = nil
      session[:frame_model] = @frame_model
      session[:gear] = session[:gear_selection]
      session[:gear_selection] = nil
      redirect_to(:action => 'bike_kit_component_packages')
    end
  end
  

  
  def show_component_packages
  check_for_frame_model
  @component_packages = ComponentPackage.find(:all, :order => 'price DESC')
  @component_package = 'active_progress'
  end
  
  def bike_kit_component_packages
  check_for_frame_model
  @component_packages = ComponentPackage.find(:all, :order => 'price DESC')
  @component_package = 'active_progress'
  end
  
  def submit_component_packages
  add_component_package_to_cart
  session[:gear] = nil
  session[:frame_model] = nil
  session[:frame_model_size] = nil
  redirect_to(:action => 'show_finishing')
  end
  
  def show_finishing
  @accessories = Accessory.find(:all, :order => 'name ASC')
  @finish = 'active_progress'
  end
  
  def submit_accessories
  add_accessory_to_cart
  flash[:notice] = 'Item Added to Cart'
  redirect_to(:back)
  end
  

  
  def check_for_reservation
    if session[:workshop]
      @reservation = 'true'
    else
      @reservation = 'false'
    end
  end
  
  def check_for_frame_model
    if session[:frame_model]
      @frame_model = 'true'
    else
      @frame_model = 'false'
    end
  end
  

  
  def add_reservation_to_cart
    @workshop = Workshop.find(params[:id])
    
    session[:workshop] = @workshop.location
    
  end
  
  def add_frame_model_to_cart
    @frame_model = FrameModel.find(params[:id])
    workshop = Workshop.find_by_location(session[:workshop])
    if session[:gear_selection] == nil
      gear = Gear.find(1)
      session[:gear_selection] = gear
    else
      gear = session[:gear_selection]
    end
    
    if session[:top_tube_selection] == nil
      top_tube_style = TopTubeStyle.find(1)
    else
      top_tube_style = session[:top_tube_selection]
    end
    
    frame_model_size = FrameModelSize.find_by_name(session[:frame_model_size])
    @cart.add_frame_model(@frame_model, frame_model_size, workshop, gear, top_tube_style)
    session[:cart] = @cart
  end
  
  def add_kit_to_cart
    @frame_model = FrameModel.find(params[:id])
    if session[:gear_selection] == nil
      gear = Gear.find(1)
      session[:gear_selection] = gear
    else
      gear = session[:gear_selection]
    end
    
    if session[:top_tube_selection] == nil
      top_tube_style = TopTubeStyle.find(1)
    else
      top_tube_style = session[:top_tube_selection]
    end
    frame_model_size = FrameModelSize.find_by_name(session[:frame_model_size])
    @cart.add_kit(@frame_model, frame_model_size, gear, top_tube_style)
    session[:cart] = @cart
  end
  
  
  def add_component_package_to_cart
    component_package = ComponentPackage.find(params[:id])
    frame_model = session[:frame_model]
    frame_model_size = FrameModelSize.find_by_name(session[:frame_model_size])
    @cart.add_component_package(component_package, frame_model, frame_model_size)
    session[:cart] = @cart
  end
  

  
  def add_accessory_to_cart
    accessory = Accessory.find(params[:id])
    @cart.add_accessory(accessory)
    session[:cart] = @cart
  end

  def remove_reservation_from_cart
    workshop = Workshop.find(params[:id])
    @cart.remove_reservation(workshop)
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def remove_frame_model_from_cart
    frame_model = FrameModel.find(params[:id])
    frame_model_size = FrameModelSize.find(params[:size_id])
    workshop = Workshop.find(params[:workshop_id])
    gear = Gear.find(params[:gear_id])
    top_tube_style = TopTubeStyle.find(params[:top_tube_style_id])
    if params[:component_package_id] == 'false'
      @cart.remove_frame_model(frame_model, frame_model_size, workshop, gear, top_tube_style)
    else
       component_package = ComponentPackage.find(params[:component_package_id])
        @cart.remove_frame_model_and_package(frame_model, frame_model_size, workshop, gear, top_tube_style, component_package )
     
    end
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def remove_component_from_cart
    @component_name = params[:name]
    @id = params[:id]
    find_component
    @cart.remove_component(@component, @name)
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def remove_component_package_from_cart
    component_package = ComponentPackage.find(params[:id])
    frame_model = FrameModel.find(params[:frame_model_id])
    @cart.remove_component_package(component_package, frame_model)
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def remove_accessory_from_cart
    accessory = Accessory.find(params[:id])
    @cart.remove_accessory(accessory)
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def show_cart
    @comp_count = 0
    @work_count = 0
  end
  
  def bamboo_bike_kits
    check_for_size_error
    @frame_models = FrameModel.find_all_by_kit(true)
    @nav_id = 'do_it_yourself'
    @model = 'active_progress'
    @frame_model_sizes = FrameModelSize.find(:all, :order => 'id ASC') 
    @top_tube_styles = TopTubeStyle.find(:all, :order => 'id ASC')
    @gears = Gear.find(:all, :order => 'id ASC')
    save_size
    save_top_tube
    save_gear
    if request.xml_http_request?
      render :partial => 'public/partials/models_table', :layout => false
    end
  end
  
  

  

  
  
  def empty_cart
    @cart.empty_all_items
    flash[:notice] = 'Your cart is now empty'
    redirect_to(:action => 'index')
  end
  
  def checkout
    if session[:customer_id]
      @customer = Customer.find(session[:customer_id])
    end
    @amount = @cart.total_price

  end
  

  
  def save_order
    @customer = Customer.new(params[:customer])
    credit_card_number = params[:credit_card]
    card_verification = params[:card_verification]
    @order = Order.new
    @order.line_items << @cart.items
    @customer.orders << @order
    if @customer.save
      #try to process payment
      #if payment fails send user to a fix-it page
      #if payment succeeds 
      @cart.empty_all_items
      redirect_to(:controller => 'payments', :action => 'new', :id => @order.id)
    else
      render('checkout')
    end
  end
  
  def show_receipt
    @order = Order.find(params[:id])
    @result = params[:result]
  end
  
  def login
    if session[:customer_id]
      @customer = Customer.find(session[:customer_id])
    end
  end
  
  def register
  
  end
  
  def save_customer
      @customer = Customer.new(params[:customer])
    if @customer.save
      CustomerMailer.registration_confirmation(@customer).deliver
      flash[:notice] = 'Registration Successful!'
      session[:customer_id] = @customer.id
      session[:first_name] = @customer.first_name
       redirect_to(:back)
      else
         flash[:notice] = 'Registration Fail!'
        render('checkout')
      end
  end
  

  
  def attempt_login
    authorized_user = Customer.authenticate(params[:email], params[:password])
    if authorized_user
      session[:customer_id] = authorized_user.id
      session[:first_name] = authorized_user.first_name
      flash[:notice] = "You are now logged in"
      if params[:redirect] == "index"
        render(:index)
      else
        redirect_to(:back)
      end
      
      
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:back)
    end
  end
  
  def logout
    session[:customer_id] = nil
    session[:first_name] = nil
    session[:cart] = nil
    flash[:notice] = "You are now logged out."
    redirect_to(:action => 'index')
  end
  
  def my_account
  @customer = Customer.find(session[:customer_id])
  @orders = Order.where(:customer_id => session[:customer_id])
  
  end
  
  private
  
  def find_or_create_cart
    @cart = session[:cart] ||= Cart.new
  end
  
  def find_or_create_customer
    @customer = session[:customer] ||= Customer.new
  end
  
  def logged_in_as
    
  end
end
