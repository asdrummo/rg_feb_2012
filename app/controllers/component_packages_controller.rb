class ComponentPackagesController < ApplicationController
  before_filter :confirm_logged_in, :except => [:show_component_package]
  before_filter :find_user
  layout 'standard'

  # GET /component_packages
  # GET /component_packages.xml
  def index
    @component_packages = ComponentPackage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @component_packages }
    end
  end

  # GET /component_packages/1
  # GET /component_packages/1.xml
  def show
    @component_package = ComponentPackage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
    end
  end
  
  def show_component_package
    @component_package = ComponentPackage.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /component_packages/new
  # GET /component_packages/new.xml
  def new
    @component_package = ComponentPackage.new
    @component_package_select = 'true'
    list_package_types
    @list_components = 'false'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component_package }
    end
  end

  # GET /component_packages/1/edit
  def edit
    @component_package = ComponentPackage.find(params[:id])
   list_components
  end
  
  def list_package_types
      @package_types = ['full-single_speed', 'full-multi_speed','drivetrain-single_speed', 'drivetrain-multi_speed','front_end-single_speed', 'front_end-multi_speed' 'wheels', 'finishing']
      @package_types_array = @package_types.map { |package_types| [package_types, package_types] }
  end
  
  def list_components
       @list_components = 'true'
       @frame_models = FrameModel.find(:all)
       @seat_posts = Component.find_all_by_component_type("Seat Post")
       @seat_clamps = Component.find_all_by_component_type("Seat Clamp")
       @stems = Component.find_all_by_component_type("Stem")
       @handlebars = Component.find_all_by_component_type("Handlebar")
       @front_levers = Component.find_all_by_component_type("Front Lever")
       @front_shifters = Component.find_all_by_component_type("Front Shifter")
       @rear_levers = Component.find_all_by_component_type("Rear Lever")
       @forks = Component.find_all_by_component_type("Fork")
       @headsets = Component.find_all_by_component_type("Headset")
       @front_derailleurs = Component.find_all_by_component_type("Front Derailleur")
       @front_wheels = Component.find_all_by_component_type("Front Wheel")
       @rear_wheels = Component.find_all_by_component_type("Rear Wheel")
       @rim_strips = Component.find_all_by_component_type("Rim Strip")
       @front_tires = Component.find_all_by_component_type("Front Tire")
       @rear_tires = Component.find_all_by_component_type("Rear Tire")
       @front_tubes = Component.find_all_by_component_type("Front Tube")
       @rear_tubes = Component.find_all_by_component_type("Rear Tube")
       @cogs = Component.find_all_by_component_type("Cog Cassette")
       @front_brakes = Component.find_all_by_component_type("Front Brake")
       @rear_brakes = Component.find_all_by_component_type("Rear Brake")
       @rear_derailleurs = Component.find_all_by_component_type("Rear Derailleur")
       @rear_shifters = Component.find_all_by_component_type("Rear Shifter")
       @bottom_brackets = Component.find_all_by_component_type("Bottom Bracket")
       @cranks = Component.find_all_by_component_type("Crank")
       @chainrings = Component.find_all_by_component_type("Chainring")
       @chains = Component.find_all_by_component_type("Chain")
       @half_links = Component.find_all_by_component_type("Half Link")
       @grips = Component.find_all_by_component_type("Grip")
       @pedals = Component.find_all_by_component_type("Pedal")
       @pedal_straps = Component.find_all_by_component_type("Pedal Strap")
       @saddles = Component.find_all_by_component_type("Saddle")
  end
  # POST /component_packages
  # POST /component_packages.xml
  def create
    if params[:package_type]
      @component_package = ComponentPackage.new(params[:component_package])
      @package_type = params[:package_type]
      @component_package_select = 'false'
      list_components
      render 'new'
    else
    @component_package = ComponentPackage.new(params[:component_package])
    respond_to do |format|
      if @component_package.save
        format.html { redirect_to(@component_package, :notice => 'ComponentPackage was successfully created.') }
        format.xml  { render :xml => @component_package, :status => :created, :location => @component_package }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component_package.errors, :status => :unprocessable_entity }
      end
    end
  end
end
      
    

  # PUT /component_packages/1
  # PUT /component_packages/1.xml
  def update
    @component_package = ComponentPackage.find(params[:id])
    respond_to do |format|
    
      if @component_package.update_attributes(params[:component_package])
        format.html { redirect_to(@component_package, :notice => 'ComponentPackage was successfully updated.') }
        format.xml  { head :ok }
        session[:frame_model_id] = nil
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component_package.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def assign_frame_model
    @component_package = ComponentPackage.find(params[:id])
    @frame_models = FrameModel.find(:all)
    @seat_posts = SeatPost.find(:all)
    if params[:frame_model]
      session[:frame_model_id] = params[:frame_model]
    else
      session[:frame_model_id] = 'no session'
    end
    
    if params[:seat_post_id]
      session[:seat_post_id] = params[:frame_model]
    else
      session[:seat_post_id] = 'no session'
    end
  
    if request.xml_http_request?
      render :partial => 'form', :layout => false
    end
    
  end
  
  def add_component
    @component_package = ComponentPackage.find(params[:id])
    @frame_models = FrameModel.find(:all)
    @seat_posts = Components::SeatPost.find(:all)
    
    if params[:frame_model]
      session[:frame_model_id] = params[:frame_model]
    else
      session[:frame_model_id] = 'no session'
    end
    
    if params[:seat_post_id]
      session[:seat_post_id] = params[:seat_post_id]
    else
      session[:seat_post_id] = 'no session'
    end

    if request.xml_http_request?
      render :partial => 'form', :layout => false
    end
    
  end

  # DELETE /component_packages/1
  # DELETE /component_packages/1.xml
  def destroy
    @component_package = ComponentPackage.find(params[:id])
    @component_package.destroy

    respond_to do |format|
      format.html { redirect_to(component_packages_url) }
      format.xml  { head :ok }
    end
  end
    private 

  def find_user
    @user = User.find(session[:user_id])
  end
end
