class Components::FrontBrakesController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/front_brakes
  # GET /components/front_brakes.xml
  def index
    @components_front_brakes = Components::FrontBrake.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_front_brakes }
    end
  end

  # GET /components/front_brakes/1
  # GET /components/front_brakes/1.xml
  def show
    @components_front_brake = Components::FrontBrake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_front_brake }
    end
  end

  # GET /components/front_brakes/new
  # GET /components/front_brakes/new.xml
  def new
    @components_front_brake = Components::FrontBrake.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_front_brake }
    end
  end

  # GET /components/front_brakes/1/edit
  def edit
    @components_front_brake = Components::FrontBrake.find(params[:id])
  end

  # POST /components/front_brakes
  # POST /components/front_brakes.xml
  def create
    @components_front_brake = Components::FrontBrake.new(params[:components_front_brake])

    respond_to do |format|
      if @components_front_brake.save
        format.html { redirect_to(@components_front_brake, :notice => 'Front brake was successfully created.') }
        format.xml  { render :xml => @components_front_brake, :status => :created, :location => @components_front_brake }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_front_brake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/front_brakes/1
  # PUT /components/front_brakes/1.xml
  def update
    @components_front_brake = Components::FrontBrake.find(params[:id])

    respond_to do |format|
      if @components_front_brake.update_attributes(params[:components_front_brake])
        format.html { redirect_to(@components_front_brake, :notice => 'Front brake was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_front_brake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/front_brakes/1
  # DELETE /components/front_brakes/1.xml
  def destroy
    @components_front_brake = Components::FrontBrake.find(params[:id])
    @components_front_brake.destroy

    respond_to do |format|
      format.html { redirect_to(components_front_brakes_url) }
      format.xml  { head :ok }
    end
  end
end
