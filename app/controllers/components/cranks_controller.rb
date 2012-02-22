class Components::CranksController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/cranks
  # GET /components/cranks.xml
  def index
    @components_cranks = Components::Crank.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_cranks }
    end
  end

  # GET /components/cranks/1
  # GET /components/cranks/1.xml
  def show
    @components_crank = Components::Crank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_crank }
    end
  end

  # GET /components/cranks/new
  # GET /components/cranks/new.xml
  def new
    @components_crank = Components::Crank.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_crank }
    end
  end

  # GET /components/cranks/1/edit
  def edit
    @components_crank = Components::Crank.find(params[:id])
  end

  # POST /components/cranks
  # POST /components/cranks.xml
  def create
    @components_crank = Components::Crank.new(params[:components_crank])

    respond_to do |format|
      if @components_crank.save
        format.html { redirect_to(@components_crank, :notice => 'Crank was successfully created.') }
        format.xml  { render :xml => @components_crank, :status => :created, :location => @components_crank }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_crank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/cranks/1
  # PUT /components/cranks/1.xml
  def update
    @components_crank = Components::Crank.find(params[:id])

    respond_to do |format|
      if @components_crank.update_attributes(params[:components_crank])
        format.html { redirect_to(@components_crank, :notice => 'Crank was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_crank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/cranks/1
  # DELETE /components/cranks/1.xml
  def destroy
    @components_crank = Components::Crank.find(params[:id])
    @components_crank.destroy

    respond_to do |format|
      format.html { redirect_to(components_cranks_url) }
      format.xml  { head :ok }
    end
  end
end
