class Components::CogsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/cogs
  # GET /components/cogs.xml
  def index
    @components_cogs = Components::Cog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_cogs }
    end
  end

  # GET /components/cogs/1
  # GET /components/cogs/1.xml
  def show
    @components_cog = Components::Cog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_cog }
    end
  end

  # GET /components/cogs/new
  # GET /components/cogs/new.xml
  def new
    @components_cog = Components::Cog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_cog }
    end
  end

  # GET /components/cogs/1/edit
  def edit
    @components_cog = Components::Cog.find(params[:id])
  end

  # POST /components/cogs
  # POST /components/cogs.xml
  def create
    @components_cog = Components::Cog.new(params[:components_cog])

    respond_to do |format|
      if @components_cog.save
        format.html { redirect_to(@components_cog, :notice => 'Cog was successfully created.') }
        format.xml  { render :xml => @components_cog, :status => :created, :location => @components_cog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_cog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/cogs/1
  # PUT /components/cogs/1.xml
  def update
    @components_cog = Components::Cog.find(params[:id])

    respond_to do |format|
      if @components_cog.update_attributes(params[:components_cog])
        format.html { redirect_to(@components_cog, :notice => 'Cog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_cog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/cogs/1
  # DELETE /components/cogs/1.xml
  def destroy
    @components_cog = Components::Cog.find(params[:id])
    @components_cog.destroy

    respond_to do |format|
      format.html { redirect_to(components_cogs_url) }
      format.xml  { head :ok }
    end
  end
end
