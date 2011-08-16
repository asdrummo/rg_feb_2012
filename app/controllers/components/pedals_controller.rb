class Components::PedalsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/pedals
  # GET /components/pedals.xml
  def index
    @components_pedals = Components::Pedal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_pedals }
    end
  end

  # GET /components/pedals/1
  # GET /components/pedals/1.xml
  def show
    @components_pedal = Components::Pedal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_pedal }
    end
  end

  # GET /components/pedals/new
  # GET /components/pedals/new.xml
  def new
    @components_pedal = Components::Pedal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_pedal }
    end
  end

  # GET /components/pedals/1/edit
  def edit
    @components_pedal = Components::Pedal.find(params[:id])
  end

  # POST /components/pedals
  # POST /components/pedals.xml
  def create
    @components_pedal = Components::Pedal.new(params[:components_pedal])

    respond_to do |format|
      if @components_pedal.save
        format.html { redirect_to(@components_pedal, :notice => 'Pedal was successfully created.') }
        format.xml  { render :xml => @components_pedal, :status => :created, :location => @components_pedal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_pedal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/pedals/1
  # PUT /components/pedals/1.xml
  def update
    @components_pedal = Components::Pedal.find(params[:id])

    respond_to do |format|
      if @components_pedal.update_attributes(params[:components_pedal])
        format.html { redirect_to(@components_pedal, :notice => 'Pedal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_pedal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/pedals/1
  # DELETE /components/pedals/1.xml
  def destroy
    @components_pedal = Components::Pedal.find(params[:id])
    @components_pedal.destroy

    respond_to do |format|
      format.html { redirect_to(components_pedals_url) }
      format.xml  { head :ok }
    end
  end
end
