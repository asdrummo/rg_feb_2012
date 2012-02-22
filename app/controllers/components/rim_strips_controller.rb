class Components::RimStripsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/rim_strips
  # GET /components/rim_strips.xml
  def index
    @components_rim_strips = Components::RimStrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_rim_strips }
    end
  end

  # GET /components/rim_strips/1
  # GET /components/rim_strips/1.xml
  def show
    @components_rim_strip = Components::RimStrip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_rim_strip }
    end
  end

  # GET /components/rim_strips/new
  # GET /components/rim_strips/new.xml
  def new
    @components_rim_strip = Components::RimStrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_rim_strip }
    end
  end

  # GET /components/rim_strips/1/edit
  def edit
    @components_rim_strip = Components::RimStrip.find(params[:id])
  end

  # POST /components/rim_strips
  # POST /components/rim_strips.xml
  def create
    @components_rim_strip = Components::RimStrip.new(params[:components_rim_strip])

    respond_to do |format|
      if @components_rim_strip.save
        format.html { redirect_to(@components_rim_strip, :notice => 'Rim strip was successfully created.') }
        format.xml  { render :xml => @components_rim_strip, :status => :created, :location => @components_rim_strip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_rim_strip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/rim_strips/1
  # PUT /components/rim_strips/1.xml
  def update
    @components_rim_strip = Components::RimStrip.find(params[:id])

    respond_to do |format|
      if @components_rim_strip.update_attributes(params[:components_rim_strip])
        format.html { redirect_to(@components_rim_strip, :notice => 'Rim strip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_rim_strip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/rim_strips/1
  # DELETE /components/rim_strips/1.xml
  def destroy
    @components_rim_strip = Components::RimStrip.find(params[:id])
    @components_rim_strip.destroy

    respond_to do |format|
      format.html { redirect_to(components_rim_strips_url) }
      format.xml  { head :ok }
    end
  end
end
