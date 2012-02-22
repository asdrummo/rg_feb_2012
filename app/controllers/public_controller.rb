class PublicController < ApplicationController
  layout 'standard'
  before_filter :confirm_logged_in
  before_filter :find_or_create_cart, :except => [:index]
  before_filter :find_or_create_customer, :only => [:checkout, :payment, :my_account, :login]
 
  def submit_component
      @component_name = params[:component]
      @id = params[:id]
      add_component_to_cart
      flash[:notice] = 'Item Added to Cart'
      redirect_to(:back)
  end
  
  def error_forbidden
    render('403')
  end
  
  def do_it_yourself
    session[:workshop_cart] = Cart.new
    @nav_id = 'do_it_yourself'
  end
  
  def bikes_to_buy
    @nav_id = 'bikes_to_buy'
  end
  
  def show_components
    @nav_id = 'show_components'
    if params[:type]
      @component = params[:type]
      @components = Component.where(:component_type => @component)
    else
      @component = "All Components"
      @components = Component.find(:all, :order => 'created_at ASC' )
    end
    
    items_per_page = 10

      sort = case params['sort']
             when "name"  then "name ASC"
             when "qty"   then "quantity ASC"
             when "price" then "price ASC"
             when "name_reverse"  then "name DESC"
             when "qty_reverse"   then "quantity DESC"
             when "price_reverse" then "price DESC"
             end

      conditions = ["LOWER(name) LIKE ?", "%#{params[:query].downcase}%"] unless params[:query].nil?
      
      
      if params[:type] 
      @total = Component.count(:conditions => conditions)
      @components = @components.where(conditions).order(sort)
      end

    if request.xml_http_request?
      render :partial => 'public/partials/component',  :layout => false 
    end
  end
  
  def sort_components
    @nav_id = 'show_components'
    @component = params[:component]

    items_per_page = 10

    sort = case params['sort']
           when "name"  then "name ASC"
           when "qty"   then "quantity ASC"
           when "price" then "price ASC"
           when "name_reverse"  then "name DESC"
           when "qty_reverse"   then "quantity DESC"
           when "price_reverse" then "price DESC"
           end

    conditions = ["LOWER(name) LIKE ?", "%#{params[:query].downcase}%"] unless params[:query].nil?

    @total = Component.count(:conditions => conditions)
    @components = Component.where(conditions).order(sort)
  
    if request.xml_http_request?
      render :partial => 'public/partials/component', :layout => false
    else
      render('index')
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

    if request.xml_http_request?
      @nav = "show_components"
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
  
  def submit_model
    @frame_model = FrameModel.new(params[:frame_model])
    if @frame_model.size_selection.blank?
      redirect_to(:action => 'show_models', :size_error => 'true')
    else
      @size_error = 'false'
      add_frame_model_to_cart
      session[:workshop] = nil
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
  @option = Option.new
  @accessories = Accessory.find(:all, :order => 'name ASC')
  @finish = 'active_progress'
  end
  
  def kit_finishing
  @option = Option.new
  @accessories = Accessory.find(:all, :order => 'name ASC')
  @finish = 'active_progress'
  end
  
  def submit_accessory
     add_accessory_to_cart
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
    session[:workshop] = @workshop.id
    @workshop_cart.add_workshop(@workshop)
    session[:workshop_cart] = @workshop_cart
  end
  
  def add_frame_model_to_cart
    frame_model = FrameModel.find(params[:id])
    session[:frame_model] = frame_model
    if session[:workshop]
      workshop = Workshop.find(session[:workshop])
    else 
      
    end
    if @frame_model.gear_selection == nil
      gear = Gear.find(1)
      session[:gear_selection] = gear
    else
      gear = Gear.find(@frame_model.gear_selection)
      session[:gear] = gear
    end
    
    if @frame_model.top_tube_selection == nil
      top_tube_style = TopTubeStyle.find(1)
    else
      top_tube_style = TopTubeStyle.find(@frame_model.top_tube_selection)
      session[:top_tube_style] = top_tube_style
    end

    frame_model_size = FrameModelSize.find(@frame_model.size_selection)
    session[:frame_model_size] = frame_model_size
    @cart.add_frame_model(frame_model, frame_model_size, workshop, gear, top_tube_style)
    @workshop_cart.add_frame_model_to_workshop(frame_model, workshop)
    session[:workshop_cart] = @workshop_cart
    session[:cart] = @cart
  end
  
  def add_kit_to_cart
    frame_model = FrameModel.find(params[:id])
    session[:frame_model] = frame_model
    if session[:gear_selection] == nil
      gear = Gear.find(1)
      session[:gear_selection] = gear
    else
      gear = session[:gear_selection]
    end
    
    if session[:top_tube_selection] == nil
      top_tube_style = TopTubeStyle.find(1)
      session[:top_tube_selection] = top_tube_style
    else
      top_tube_style = session[:top_tube_selection]
    end
    frame_model_size = FrameModelSize.find(params[:frame_model][:size_selection])
    @cart.add_kit(frame_model, frame_model_size, gear, top_tube_style)
    session[:cart] = @cart
  end
  
  def add_component_package_to_cart
    component_package = ComponentPackage.find(params[:id])
    frame_model = session[:frame_model]
    frame_model_size = session[:frame_model_size]
    @cart.add_component_package(component_package, frame_model, frame_model_size)
    session[:cart] = @cart
  end
  
  def add_component_to_cart
    component = Component.find(params[:id])
    @cart.add_component(component)
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
    elsif @component_name == 'Front Derailleurs'
      @component = Components::FrontDerailleur.find(@id)
      @name = "front_derailleur"
    elsif @component_name == 'Rear Derailleurs'
      @component = Components::RearDerailleur.find(@id)
      @name = "rear_derailleur"
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
    elsif @component_name == 'Front Shifters'
      @component = Components::FrontShifter.find(@id)
      @name = "front_shifter"
    elsif @component_name == 'Rear Shifters'
      @component = Components::RearShifter.find(@id)
      @name = "rear_shifter"
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
 
  def add_accessory_to_cart
    accessory = Accessory.find(params[:id])
    if params[:option]
      if params[:option][:id].blank?
        flash[:notice] = 'Please pick an option for' + accessory.name
      else
        option = Option.find(params[:option][:id])
        @cart.add_accessory(accessory, option)
        flash[:notice] = 'Item Added to Cart'
      end
    else
      @cart.add_accessory_no_option(accessory)
      flash[:notice] = 'Item Added to Cart'
    end
    session[:cart] = @cart
  end

  def add_build_to_cart
    build = session[:build] 
    if session[:customer_build_id]
      customer_build = CustomerBuild.find(session[:customer_build_id])
      build_items = CustomerBuildItem.find_all_by_customer_build_id(customer_build.id)
      build_items.each{ |u| u.destroy }
    else
      customer_build = CustomerBuild.new
    end
      customer_build.customer_build_items << build.items
    if session[:customer_id]
      customer_build.update_attributes(:customer_id => session[:customer_id], :price => build.total_price)
    else
      customer_build.update_attributes(:price => build.total_price)
    end
    customer_build.save
    @cart.add_customer_build(customer_build)
    flash[:notice] = 'Build Added to Cart'
    redirect_back
  end
  
  
  def remove_customer_build_from_cart
    customer_build = CustomerBuild.find(params[:id])
    @cart.remove_customer_build(customer_build)
    session[:cart] = @cart
    flash[:notice] = 'Build Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
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
    if params[:workshop_id]
        workshop = Workshop.find(params[:workshop_id])
    
      gear = Gear.find(params[:gear_id])
      top_tube_style = TopTubeStyle.find(params[:top_tube_style_id])
      if params[:component_package_id] == 'false'
        @cart.remove_frame_model(frame_model, frame_model_size, workshop, gear, top_tube_style)
      else
         component_package = ComponentPackage.find(params[:component_package_id])
          @cart.remove_frame_model_and_package(frame_model, frame_model_size, workshop, gear, top_tube_style, component_package )
     
      end
    else
      gear = Gear.find(params[:gear_id])
      top_tube_style = TopTubeStyle.find(params[:top_tube_style_id])
      if params[:component_package_id] == 'false'
        @cart.remove_kit(frame_model, frame_model_size, gear, top_tube_style)
      else
         component_package = ComponentPackage.find(params[:component_package_id])
          @cart.remove_kit_and_package(frame_model, frame_model_size, gear, top_tube_style, component_package )
     
      end
      
    end
    session[:cart] = @cart
    flash[:notice] = 'Item Successfully Removed From Cart'
    redirect_to(:action => 'show_cart')
  end
  
  def remove_component_from_cart
    component = Component.find(params[:id])
    @cart.remove_component(component)
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
    if request.xml_http_request?
      render :partial => 'public/partials/models_table', :layout => false
    end
  end
  
  def empty_cart
    @cart.empty_all_items
    @workshop_cart.empty_all_items
    flash[:notice] = 'Your cart is now empty'
    redirect_to(:action => 'index')
  end
  
  def checkout
    @shipping_address = ShippingAddress.new
    if @prev_shipping = ShippingAddress.find_all_by_customer_id(session[:customer_id])
    end
    @amount = @cart.total_price
    @comp_count = 0
    @work_count = 0
  end
    
  def payment
    if params[:shipping_address]
      @shipping_address = ShippingAddress.new(params[:shipping_address])
      if @shipping_address.save
      @amount = @cart.total_price
      session[:shipping_id] = @shipping_address.id
      render('payment')
      end
      
    elsif params[:shipping_id]
      @shipping_address = ShippingAddress.find(params[:shipping_id])
      @amount = @cart.total_price
      session[:shipping_id] = @shipping_address.id
      render('payment')
    elsif
      render('checkout')
    end
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
    respond_to do |format|
      format.html
      format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity } 
      format.js {render 'public/login.js'}
    end
  end
  
  def register
  @customer = Customer.new
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
        flash[:notice] = 'Registration Failed!'
           render('register')
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
    render ('index')
  end
  
  def my_account
  @orders = Order.where(:customer_id => session[:customer_id])
  @builds = CustomerBuild.where(:customer_id => session[:customer_id])
  end
  
  def redirect_back
    redirect_to :back
    rescue ActionController::RedirectBackError
    render :partial => 'shared/referrer_error'
  end
  
  private
  
  def find_or_create_cart
    @cart = session[:cart] ||= Cart.new
    @build = session[:build] ||= Build.new
    @workshop_cart = session[:workshop_cart] ||= Cart.new
  end
  
  def find_or_create_customer
    if session[:customer_id]
    @customer = Customer.find(session[:customer_id])
    else 
    @customer = session[:customer] ||= Customer.new
    end
  end
  
  def logged_in_as
  end
  
  def show_invoice
    if session[:customer_id]
    @customer = Customer.find(session[:customer_id])
    @order = Order.find_by_invoice_number(params[:id])
    authorize_customer_access(@order)
    else
      redirect_to(:controller => 'public', :action => 'error_forbidden')
    end
  end
  
  def authorize_customer_access(order)
    if order.customer_id == session[:customer_id]
    else
        redirect_to(:controller => 'public', :action => 'error_forbidden')
        return false
    end
  end
  
end
