class ComponentPackagesController < ApplicationController
  :confirm_logged_in
  layout 'admin'

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

  # GET /component_packages/new
  # GET /component_packages/new.xml
  def new
    @component_package = ComponentPackage.new
 
     @frame_models = FrameModel.find(:all)
     @seat_posts = Components::SeatPost.find(:all)
     @seat_clamps = Components::SeatClamp.find(:all)
     @stems = Components::Stem.find(:all)
     @handlebars = Components::Handlebar.find(:all)
     @front_levers = Components::FrontLever.find(:all)
     @rear_levers = Components::RearLever.find(:all)
     @forks = Components::Fork.find(:all)
     @headsets = Components::Headset.find(:all)
     @front_wheels = Components::FrontWheel.find(:all)
     @rear_wheels = Components::RearWheel.find(:all)
     @rim_strips = Components::RimStrip.find(:all)
     @front_tires = Components::FrontTire.find(:all)
     @rear_tires = Components::RearTire.find(:all)
     @front_tubes = Components::FrontTube.find(:all)
     @rear_tubes = Components::RearTube.find(:all)
     @cogs = Components::Cog.find(:all)
     @front_brakes = Components::FrontBrake.find(:all)
     @rear_brakes = Components::RearBrake.find(:all)
     @bottom_brackets = Components::BottomBracket.find(:all)
     @cranks = Components::Crank.find(:all)
     @chainrings = Components::Chainring.find(:all)
     @chains = Components::Chain.find(:all)
     @half_links = Components::HalfLink.find(:all)
     @grips = Components::Grip.find(:all)
     @pedals = Components::Pedal.find(:all)
     @saddles = Components::Saddle.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /component_packages/1/edit
  def edit
    @component_package = ComponentPackage.find(params[:id])
    @frame_models = FrameModel.find(:all)
    @seat_posts = Components::SeatPost.find(:all)
    @seat_clamps = Components::SeatClamp.find(:all)
    @stems = Components::Stem.find(:all)
    @handlebars = Components::Handlebar.find(:all)
    @front_levers = Components::FrontLever.find(:all)
    @rear_levers = Components::RearLever.find(:all)
    @forks = Components::Fork.find(:all)
    @headsets = Components::Headset.find(:all)
    @front_wheels = Components::FrontWheel.find(:all)
    @rear_wheels = Components::RearWheel.find(:all)
    @rim_strips = Components::RimStrip.find(:all)
    @front_tires = Components::FrontTire.find(:all)
    @rear_tires = Components::RearTire.find(:all)
    @front_tubes = Components::FrontTube.find(:all)
    @rear_tubes = Components::RearTube.find(:all)
    @cogs = Components::Cog.find(:all)
    @front_brakes = Components::FrontBrake.find(:all)
    @rear_brakes = Components::RearBrake.find(:all)
    @bottom_brackets = Components::BottomBracket.find(:all)
    @cranks = Components::Crank.find(:all)
    @chainrings = Components::Chainring.find(:all)
    @chains = Components::Chain.find(:all)
    @half_links = Components::HalfLink.find(:all)
    @grips = Components::Grip.find(:all)
    @pedals = Components::Pedal.find(:all)
    @saddles = Components::Saddle.find(:all)
  end

  # POST /component_packages
  # POST /component_packages.xml
  def create
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
end
