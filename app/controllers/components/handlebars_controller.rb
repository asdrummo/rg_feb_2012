class Components::HandlebarsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/handlebars
  # GET /components/handlebars.xml
  def index
    @components_handlebars = Components::Handlebar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_handlebars }
    end
  end

  # GET /components/handlebars/1
  # GET /components/handlebars/1.xml
  def show
    @components_handlebar = Components::Handlebar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_handlebar }
    end
  end

  # GET /components/handlebars/new
  # GET /components/handlebars/new.xml
  def new
    @components_handlebar = Components::Handlebar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_handlebar }
    end
  end

  # GET /components/handlebars/1/edit
  def edit
    @components_handlebar = Components::Handlebar.find(params[:id])
  end

  # POST /components/handlebars
  # POST /components/handlebars.xml
  def create
    @components_handlebar = Components::Handlebar.new(params[:components_handlebar])

    respond_to do |format|
      if @components_handlebar.save
        format.html { redirect_to(@components_handlebar, :notice => 'Handlebar was successfully created.') }
        format.xml  { render :xml => @components_handlebar, :status => :created, :location => @components_handlebar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_handlebar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/handlebars/1
  # PUT /components/handlebars/1.xml
  def update
    @components_handlebar = Components::Handlebar.find(params[:id])

    respond_to do |format|
      if @components_handlebar.update_attributes(params[:components_handlebar])
        format.html { redirect_to(@components_handlebar, :notice => 'Handlebar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_handlebar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/handlebars/1
  # DELETE /components/handlebars/1.xml
  def destroy
    @components_handlebar = Components::Handlebar.find(params[:id])
    @components_handlebar.destroy

    respond_to do |format|
      format.html { redirect_to(components_handlebars_url) }
      format.xml  { head :ok }
    end
  end
end
