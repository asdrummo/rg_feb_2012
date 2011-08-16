class Components::RearBrakesController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rear_brakes
  # GET /components/rear_brakes.xml
  def index
    @components_rear_brakes = Components::RearBrake.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rear_brakes }
    end
  end

  # GET /components/rear_brakes/1
  # GET /components/rear_brakes/1.xml
  def show
    @components_rear_brake = Components::RearBrake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rear_brake }
    end
  end

  # GET /components/rear_brakes/new
  # GET /components/rear_brakes/new.xml
  def new
    @components_rear_brake = Components::RearBrake.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rear_brake }
    end
  end

  # GET /components/rear_brakes/1/edit
  def edit
    @components_rear_brake = Components::RearBrake.find(params[:id])
  end

  # POST /components/rear_brakes
  # POST /components/rear_brakes.xml
  def create
    @components_rear_brake = Components::RearBrake.new(params[:components_rear_brake])

    respond_to do |format|
      if @components_rear_brake.save
        format.html { redirect_to(@components_rear_brake, :notice => 'Rear brake was successfully created.') }
        format.xml  { render :xml => @components_rear_brake, :status => :created, :location => @components_rear_brake }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rear_brake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rear_brakes/1
  # PUT /components/rear_brakes/1.xml
  def update
    @components_rear_brake = Components::RearBrake.find(params[:id])

    respond_to do |format|
      if @components_rear_brake.update_attributes(params[:components_rear_brake])
        format.html { redirect_to(@components_rear_brake, :notice => 'Rear brake was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rear_brake.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rear_brakes/1
  # DELETE /components/rear_brakes/1.xml
  def destroy
    @components_rear_brake = Components::RearBrake.find(params[:id])
    @components_rear_brake.destroy

    respond_to do |format|
      format.html { redirect_to(components_rear_brakes_url) }
      format.xml  { head :ok }
    end
  end
end
