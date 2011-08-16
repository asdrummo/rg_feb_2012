class PublicController < ApplicationController
  layout 'standard'
  before_filter :find_or_create_cart, :except => [:index]
  before_filter :find_or_create_customer, :only => [:checkout]
  
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
  
  def add_component_to_cart
    component = Component.find(params[:id])
    @cart.add_component(component)
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
  
  def remove_components_from_cart
    components = Components.find(params[:id])
    @cart.remove_components(components)
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
        redirect_to(:back)
      
      
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
