class Components::GripsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/grips
  # GET /components/grips.xml
  def index
    @components_grips = Components::Grip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_grips }
    end
  end

  # GET /components/grips/1
  # GET /components/grips/1.xml
  def show
    @components_grip = Components::Grip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_grip }
    end
  end

  # GET /components/grips/new
  # GET /components/grips/new.xml
  def new
    @components_grip = Components::Grip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_grip }
    end
  end

  # GET /components/grips/1/edit
  def edit
    @components_grip = Components::Grip.find(params[:id])
  end

  # POST /components/grips
  # POST /components/grips.xml
  def create
    @components_grip = Components::Grip.new(params[:components_grip])

    respond_to do |format|
      if @components_grip.save
        format.html { redirect_to(@components_grip, :notice => 'Grip was successfully created.') }
        format.xml  { render :xml => @components_grip, :status => :created, :location => @components_grip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_grip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/grips/1
  # PUT /components/grips/1.xml
  def update
    @components_grip = Components::Grip.find(params[:id])

    respond_to do |format|
      if @components_grip.update_attributes(params[:components_grip])
        format.html { redirect_to(@components_grip, :notice => 'Grip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_grip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/grips/1
  # DELETE /components/grips/1.xml
  def destroy
    @components_grip = Components::Grip.find(params[:id])
    @components_grip.destroy

    respond_to do |format|
      format.html { redirect_to(components_grips_url) }
      format.xml  { head :ok }
    end
  end
end
