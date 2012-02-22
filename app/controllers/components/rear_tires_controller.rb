class Components::RearTiresController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rear_tires
  # GET /components/rear_tires.xml
  def index
    @components_rear_tires = Components::RearTire.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rear_tires }
    end
  end

  # GET /components/rear_tires/1
  # GET /components/rear_tires/1.xml
  def show
    @components_rear_tire = Components::RearTire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rear_tire }
    end
  end

  # GET /components/rear_tires/new
  # GET /components/rear_tires/new.xml
  def new
    @components_rear_tire = Components::RearTire.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rear_tire }
    end
  end

  # GET /components/rear_tires/1/edit
  def edit
    @components_rear_tire = Components::RearTire.find(params[:id])
  end

  # POST /components/rear_tires
  # POST /components/rear_tires.xml
  def create
    @components_rear_tire = Components::RearTire.new(params[:components_rear_tire])

    respond_to do |format|
      if @components_rear_tire.save
        format.html { redirect_to(@components_rear_tire, :notice => 'Rear tire was successfully created.') }
        format.xml  { render :xml => @components_rear_tire, :status => :created, :location => @components_rear_tire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rear_tire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rear_tires/1
  # PUT /components/rear_tires/1.xml
  def update
    @components_rear_tire = Components::RearTire.find(params[:id])

    respond_to do |format|
      if @components_rear_tire.update_attributes(params[:components_rear_tire])
        format.html { redirect_to(@components_rear_tire, :notice => 'Rear tire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rear_tire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rear_tires/1
  # DELETE /components/rear_tires/1.xml
  def destroy
    @components_rear_tire = Components::RearTire.find(params[:id])
    @components_rear_tire.destroy

    respond_to do |format|
      format.html { redirect_to(components_rear_tires_url) }
      format.xml  { head :ok }
    end
  end
end
