class Components::FrontTiresController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/front_tires
  # GET /components/front_tires.xml
  def index
    @components_front_tires = Components::FrontTire.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_front_tires }
    end
  end

  # GET /components/front_tires/1
  # GET /components/front_tires/1.xml
  def show
    @components_front_tire = Components::FrontTire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_front_tire }
    end
  end

  # GET /components/front_tires/new
  # GET /components/front_tires/new.xml
  def new
    @components_front_tire = Components::FrontTire.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_front_tire }
    end
  end

  # GET /components/front_tires/1/edit
  def edit
    @components_front_tire = Components::FrontTire.find(params[:id])
  end

  # POST /components/front_tires
  # POST /components/front_tires.xml
  def create
    @components_front_tire = Components::FrontTire.new(params[:components_front_tire])

    respond_to do |format|
      if @components_front_tire.save
        format.html { redirect_to(@components_front_tire, :notice => 'Front tire was successfully created.') }
        format.xml  { render :xml => @components_front_tire, :status => :created, :location => @components_front_tire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_front_tire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/front_tires/1
  # PUT /components/front_tires/1.xml
  def update
    @components_front_tire = Components::FrontTire.find(params[:id])

    respond_to do |format|
      if @components_front_tire.update_attributes(params[:components_front_tire])
        format.html { redirect_to(@components_front_tire, :notice => 'Front tire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_front_tire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/front_tires/1
  # DELETE /components/front_tires/1.xml
  def destroy
    @components_front_tire = Components::FrontTire.find(params[:id])
    @components_front_tire.destroy

    respond_to do |format|
      format.html { redirect_to(components_front_tires_url) }
      format.xml  { head :ok }
    end
  end
end
