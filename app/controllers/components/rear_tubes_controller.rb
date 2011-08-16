class Components::RearTubesController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rear_tubes
  # GET /components/rear_tubes.xml
  def index
    @components_rear_tubes = Components::RearTube.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rear_tubes }
    end
  end

  # GET /components/rear_tubes/1
  # GET /components/rear_tubes/1.xml
  def show
    @components_rear_tube = Components::RearTube.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rear_tube }
    end
  end

  # GET /components/rear_tubes/new
  # GET /components/rear_tubes/new.xml
  def new
    @components_rear_tube = Components::RearTube.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rear_tube }
    end
  end

  # GET /components/rear_tubes/1/edit
  def edit
    @components_rear_tube = Components::RearTube.find(params[:id])
  end

  # POST /components/rear_tubes
  # POST /components/rear_tubes.xml
  def create
    @components_rear_tube = Components::RearTube.new(params[:components_rear_tube])

    respond_to do |format|
      if @components_rear_tube.save
        format.html { redirect_to(@components_rear_tube, :notice => 'Rear tube was successfully created.') }
        format.xml  { render :xml => @components_rear_tube, :status => :created, :location => @components_rear_tube }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rear_tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rear_tubes/1
  # PUT /components/rear_tubes/1.xml
  def update
    @components_rear_tube = Components::RearTube.find(params[:id])

    respond_to do |format|
      if @components_rear_tube.update_attributes(params[:components_rear_tube])
        format.html { redirect_to(@components_rear_tube, :notice => 'Rear tube was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rear_tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rear_tubes/1
  # DELETE /components/rear_tubes/1.xml
  def destroy
    @components_rear_tube = Components::RearTube.find(params[:id])
    @components_rear_tube.destroy

    respond_to do |format|
      format.html { redirect_to(components_rear_tubes_url) }
      format.xml  { head :ok }
    end
  end
end
