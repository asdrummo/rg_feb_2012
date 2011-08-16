class Components::FrontWheelsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/front_wheels
  # GET /components/front_wheels.xml
  def index
    @components_front_wheels = Components::FrontWheel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_front_wheels }
    end
  end

  # GET /components/front_wheels/1
  # GET /components/front_wheels/1.xml
  def show
    @components_front_wheel = Components::FrontWheel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_front_wheel }
    end
  end

  # GET /components/front_wheels/new
  # GET /components/front_wheels/new.xml
  def new
    @components_front_wheel = Components::FrontWheel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_front_wheel }
    end
  end

  # GET /components/front_wheels/1/edit
  def edit
    @components_front_wheel = Components::FrontWheel.find(params[:id])
  end

  # POST /components/front_wheels
  # POST /components/front_wheels.xml
  def create
    @components_front_wheel = Components::FrontWheel.new(params[:components_front_wheel])

    respond_to do |format|
      if @components_front_wheel.save
        format.html { redirect_to(@components_front_wheel, :notice => 'Front wheel was successfully created.') }
        format.xml  { render :xml => @components_front_wheel, :status => :created, :location => @components_front_wheel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_front_wheel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/front_wheels/1
  # PUT /components/front_wheels/1.xml
  def update
    @components_front_wheel = Components::FrontWheel.find(params[:id])

    respond_to do |format|
      if @components_front_wheel.update_attributes(params[:components_front_wheel])
        format.html { redirect_to(@components_front_wheel, :notice => 'Front wheel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_front_wheel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/front_wheels/1
  # DELETE /components/front_wheels/1.xml
  def destroy
    @components_front_wheel = Components::FrontWheel.find(params[:id])
    @components_front_wheel.destroy

    respond_to do |format|
      format.html { redirect_to(components_front_wheels_url) }
      format.xml  { head :ok }
    end
  end
end
