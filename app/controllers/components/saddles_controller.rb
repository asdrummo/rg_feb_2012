class Components::SaddlesController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/saddles
  # GET /components/saddles.xml
  def index
    @components_saddles = Components::Saddle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_saddles }
    end
  end

  # GET /components/saddles/1
  # GET /components/saddles/1.xml
  def show
    @components_saddle = Components::Saddle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_saddle }
    end
  end

  # GET /components/saddles/new
  # GET /components/saddles/new.xml
  def new
    @components_saddle = Components::Saddle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_saddle }
    end
  end

  # GET /components/saddles/1/edit
  def edit
    @components_saddle = Components::Saddle.find(params[:id])
  end

  # POST /components/saddles
  # POST /components/saddles.xml
  def create
    @components_saddle = Components::Saddle.new(params[:components_saddle])

    respond_to do |format|
      if @components_saddle.save
        format.html { redirect_to(@components_saddle, :notice => 'Saddle was successfully created.') }
        format.xml  { render :xml => @components_saddle, :status => :created, :location => @components_saddle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_saddle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/saddles/1
  # PUT /components/saddles/1.xml
  def update
    @components_saddle = Components::Saddle.find(params[:id])

    respond_to do |format|
      if @components_saddle.update_attributes(params[:components_saddle])
        format.html { redirect_to(@components_saddle, :notice => 'Saddle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_saddle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/saddles/1
  # DELETE /components/saddles/1.xml
  def destroy
    @components_saddle = Components::Saddle.find(params[:id])
    @components_saddle.destroy

    respond_to do |format|
      format.html { redirect_to(components_saddles_url) }
      format.xml  { head :ok }
    end
  end
end
