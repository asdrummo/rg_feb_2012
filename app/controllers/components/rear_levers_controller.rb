class Components::RearLeversController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rear_levers
  # GET /components/rear_levers.xml
  def index
    @components_rear_levers = Components::RearLever.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rear_levers }
    end
  end

  # GET /components/rear_levers/1
  # GET /components/rear_levers/1.xml
  def show
    @components_rear_lever = Components::RearLever.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rear_lever }
    end
  end

  # GET /components/rear_levers/new
  # GET /components/rear_levers/new.xml
  def new
    @components_rear_lever = Components::RearLever.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rear_lever }
    end
  end

  # GET /components/rear_levers/1/edit
  def edit
    @components_rear_lever = Components::RearLever.find(params[:id])
  end

  # POST /components/rear_levers
  # POST /components/rear_levers.xml
  def create
    @components_rear_lever = Components::RearLever.new(params[:components_rear_lever])

    respond_to do |format|
      if @components_rear_lever.save
        format.html { redirect_to(@components_rear_lever, :notice => 'Rear lever was successfully created.') }
        format.xml  { render :xml => @components_rear_lever, :status => :created, :location => @components_rear_lever }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rear_lever.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rear_levers/1
  # PUT /components/rear_levers/1.xml
  def update
    @components_rear_lever = Components::RearLever.find(params[:id])

    respond_to do |format|
      if @components_rear_lever.update_attributes(params[:components_rear_lever])
        format.html { redirect_to(@components_rear_lever, :notice => 'Rear lever was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rear_lever.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rear_levers/1
  # DELETE /components/rear_levers/1.xml
  def destroy
    @components_rear_lever = Components::RearLever.find(params[:id])
    @components_rear_lever.destroy

    respond_to do |format|
      format.html { redirect_to(components_rear_levers_url) }
      format.xml  { head :ok }
    end
  end
end
