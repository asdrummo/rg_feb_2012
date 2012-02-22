class Components::FrontTubesController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/front_tubes
  # GET /components/front_tubes.xml
  def index
    @components_front_tubes = Components::FrontTube.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_front_tubes }
    end
  end

  # GET /components/front_tubes/1
  # GET /components/front_tubes/1.xml
  def show
    @components_front_tube = Components::FrontTube.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_front_tube }
    end
  end

  # GET /components/front_tubes/new
  # GET /components/front_tubes/new.xml
  def new
    @components_front_tube = Components::FrontTube.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_front_tube }
    end
  end

  # GET /components/front_tubes/1/edit
  def edit
    @components_front_tube = Components::FrontTube.find(params[:id])
  end

  # POST /components/front_tubes
  # POST /components/front_tubes.xml
  def create
    @components_front_tube = Components::FrontTube.new(params[:components_front_tube])

    respond_to do |format|
      if @components_front_tube.save
        format.html { redirect_to(@components_front_tube, :notice => 'Front tube was successfully created.') }
        format.xml  { render :xml => @components_front_tube, :status => :created, :location => @components_front_tube }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_front_tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/front_tubes/1
  # PUT /components/front_tubes/1.xml
  def update
    @components_front_tube = Components::FrontTube.find(params[:id])

    respond_to do |format|
      if @components_front_tube.update_attributes(params[:components_front_tube])
        format.html { redirect_to(@components_front_tube, :notice => 'Front tube was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_front_tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/front_tubes/1
  # DELETE /components/front_tubes/1.xml
  def destroy
    @components_front_tube = Components::FrontTube.find(params[:id])
    @components_front_tube.destroy

    respond_to do |format|
      format.html { redirect_to(components_front_tubes_url) }
      format.xml  { head :ok }
    end
  end
end
