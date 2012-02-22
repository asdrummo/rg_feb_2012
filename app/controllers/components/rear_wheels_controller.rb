class Components::RearWheelsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rear_wheels
  # GET /components/rear_wheels.xml
  def index
    @components_rear_wheels = Components::RearWheel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rear_wheels }
    end
  end

  # GET /components/rear_wheels/1
  # GET /components/rear_wheels/1.xml
  def show
    @components_rear_wheel = Components::RearWheel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rear_wheel }
    end
  end

  # GET /components/rear_wheels/new
  # GET /components/rear_wheels/new.xml
  def new
    @components_rear_wheel = Components::RearWheel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rear_wheel }
    end
  end

  # GET /components/rear_wheels/1/edit
  def edit
    @components_rear_wheel = Components::RearWheel.find(params[:id])
  end

  # POST /components/rear_wheels
  # POST /components/rear_wheels.xml
  def create
    @components_rear_wheel = Components::RearWheel.new(params[:components_rear_wheel])

    respond_to do |format|
      if @components_rear_wheel.save
        format.html { redirect_to(@components_rear_wheel, :notice => 'Rear wheel was successfully created.') }
        format.xml  { render :xml => @components_rear_wheel, :status => :created, :location => @components_rear_wheel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rear_wheel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rear_wheels/1
  # PUT /components/rear_wheels/1.xml
  def update
    @components_rear_wheel = Components::RearWheel.find(params[:id])

    respond_to do |format|
      if @components_rear_wheel.update_attributes(params[:components_rear_wheel])
        format.html { redirect_to(@components_rear_wheel, :notice => 'Rear wheel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rear_wheel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rear_wheels/1
  # DELETE /components/rear_wheels/1.xml
  def destroy
    @components_rear_wheel = Components::RearWheel.find(params[:id])
    @components_rear_wheel.destroy

    respond_to do |format|
      format.html { redirect_to(components_rear_wheels_url) }
      format.xml  { head :ok }
    end
  end
end
