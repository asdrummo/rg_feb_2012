class Components::HeadsetsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/headsets
  # GET /components/headsets.xml
  def index
    @components_headsets = Components::Headset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_headsets }
    end
  end

  # GET /components/headsets/1
  # GET /components/headsets/1.xml
  def show
    @components_headset = Components::Headset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_headset }
    end
  end

  # GET /components/headsets/new
  # GET /components/headsets/new.xml
  def new
    @components_headset = Components::Headset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_headset }
    end
  end

  # GET /components/headsets/1/edit
  def edit
    @components_headset = Components::Headset.find(params[:id])
  end

  # POST /components/headsets
  # POST /components/headsets.xml
  def create
    @components_headset = Components::Headset.new(params[:components_headset])

    respond_to do |format|
      if @components_headset.save
        format.html { redirect_to(@components_headset, :notice => 'Headset was successfully created.') }
        format.xml  { render :xml => @components_headset, :status => :created, :location => @components_headset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_headset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/headsets/1
  # PUT /components/headsets/1.xml
  def update
    @components_headset = Components::Headset.find(params[:id])

    respond_to do |format|
      if @components_headset.update_attributes(params[:components_headset])
        format.html { redirect_to(@components_headset, :notice => 'Headset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_headset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/headsets/1
  # DELETE /components/headsets/1.xml
  def destroy
    @components_headset = Components::Headset.find(params[:id])
    @components_headset.destroy

    respond_to do |format|
      format.html { redirect_to(components_headsets_url) }
      format.xml  { head :ok }
    end
  end
end
