class Components::FrontLeversController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/front_levers
  # GET /components/front_levers.xml
  def index
    @components_front_levers = Components::FrontLever.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_front_levers }
    end
  end

  # GET /components/front_levers/1
  # GET /components/front_levers/1.xml
  def show
    @components_front_lever = Components::FrontLever.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_front_lever }
    end
  end

  # GET /components/front_levers/new
  # GET /components/front_levers/new.xml
  def new
    @components_front_lever = Components::FrontLever.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_front_lever }
    end
  end

  # GET /components/front_levers/1/edit
  def edit
    @components_front_lever = Components::FrontLever.find(params[:id])
  end

  # POST /components/front_levers
  # POST /components/front_levers.xml
  def create
    @components_front_lever = Components::FrontLever.new(params[:components_front_lever])

    respond_to do |format|
      if @components_front_lever.save
        format.html { redirect_to(@components_front_lever, :notice => 'Front lever was successfully created.') }
        format.xml  { render :xml => @components_front_lever, :status => :created, :location => @components_front_lever }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_front_lever.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/front_levers/1
  # PUT /components/front_levers/1.xml
  def update
    @components_front_lever = Components::FrontLever.find(params[:id])

    respond_to do |format|
      if @components_front_lever.update_attributes(params[:components_front_lever])
        format.html { redirect_to(@components_front_lever, :notice => 'Front lever was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_front_lever.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/front_levers/1
  # DELETE /components/front_levers/1.xml
  def destroy
    @components_front_lever = Components::FrontLever.find(params[:id])
    @components_front_lever.destroy

    respond_to do |format|
      format.html { redirect_to(components_front_levers_url) }
      format.xml  { head :ok }
    end
  end
end
