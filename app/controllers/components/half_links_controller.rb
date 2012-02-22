class Components::HalfLinksController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/half_links
  # GET /components/half_links.xml
  def index
    @components_half_links = Components::HalfLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_half_links }
    end
  end

  # GET /components/half_links/1
  # GET /components/half_links/1.xml
  def show
    @components_half_link = Components::HalfLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_half_link }
    end
  end

  # GET /components/half_links/new
  # GET /components/half_links/new.xml
  def new
    @components_half_link = Components::HalfLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_half_link }
    end
  end

  # GET /components/half_links/1/edit
  def edit
    @components_half_link = Components::HalfLink.find(params[:id])
  end

  # POST /components/half_links
  # POST /components/half_links.xml
  def create
    @components_half_link = Components::HalfLink.new(params[:components_half_link])

    respond_to do |format|
      if @components_half_link.save
        format.html { redirect_to(@components_half_link, :notice => 'Half link was successfully created.') }
        format.xml  { render :xml => @components_half_link, :status => :created, :location => @components_half_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_half_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/half_links/1
  # PUT /components/half_links/1.xml
  def update
    @components_half_link = Components::HalfLink.find(params[:id])

    respond_to do |format|
      if @components_half_link.update_attributes(params[:components_half_link])
        format.html { redirect_to(@components_half_link, :notice => 'Half link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_half_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/half_links/1
  # DELETE /components/half_links/1.xml
  def destroy
    @components_half_link = Components::HalfLink.find(params[:id])
    @components_half_link.destroy

    respond_to do |format|
      format.html { redirect_to(components_half_links_url) }
      format.xml  { head :ok }
    end
  end
end
