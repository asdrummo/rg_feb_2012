class Components::ChainringsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/chainrings
  # GET /components/chainrings.xml
  def index
    @components_chainrings = Components::Chainring.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_chainrings }
    end
  end

  # GET /components/chainrings/1
  # GET /components/chainrings/1.xml
  def show
    @components_chainring = Components::Chainring.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_chainring }
    end
  end

  # GET /components/chainrings/new
  # GET /components/chainrings/new.xml
  def new
    @components_chainring = Components::Chainring.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_chainring }
    end
  end

  # GET /components/chainrings/1/edit
  def edit
    @components_chainring = Components::Chainring.find(params[:id])
  end

  # POST /components/chainrings
  # POST /components/chainrings.xml
  def create
    @components_chainring = Components::Chainring.new(params[:components_chainring])

    respond_to do |format|
      if @components_chainring.save
        format.html { redirect_to(@components_chainring, :notice => 'Chainring was successfully created.') }
        format.xml  { render :xml => @components_chainring, :status => :created, :location => @components_chainring }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_chainring.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/chainrings/1
  # PUT /components/chainrings/1.xml
  def update
    @components_chainring = Components::Chainring.find(params[:id])

    respond_to do |format|
      if @components_chainring.update_attributes(params[:components_chainring])
        format.html { redirect_to(@components_chainring, :notice => 'Chainring was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_chainring.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/chainrings/1
  # DELETE /components/chainrings/1.xml
  def destroy
    @components_chainring = Components::Chainring.find(params[:id])
    @components_chainring.destroy

    respond_to do |format|
      format.html { redirect_to(components_chainrings_url) }
      format.xml  { head :ok }
    end
  end
end
