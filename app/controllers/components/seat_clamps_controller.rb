class Components::SeatClampsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/seat_clamps
  # GET /components/seat_clamps.xml
  def index
    @components_seat_clamps = Components::SeatClamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_seat_clamps }
    end
  end

  # GET /components/seat_clamps/1
  # GET /components/seat_clamps/1.xml
  def show
    @components_seat_clamp = Components::SeatClamp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_seat_clamp }
    end
  end

  # GET /components/seat_clamps/new
  # GET /components/seat_clamps/new.xml
  def new
    @components_seat_clamp = Components::SeatClamp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_seat_clamp }
    end
  end

  # GET /components/seat_clamps/1/edit
  def edit
    @components_seat_clamp = Components::SeatClamp.find(params[:id])
  end

  # POST /components/seat_clamps
  # POST /components/seat_clamps.xml
  def create
    @components_seat_clamp = Components::SeatClamp.new(params[:components_seat_clamp])

    respond_to do |format|
      if @components_seat_clamp.save
        format.html { redirect_to(@components_seat_clamp, :notice => 'Seat clamp was successfully created.') }
        format.xml  { render :xml => @components_seat_clamp, :status => :created, :location => @components_seat_clamp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_seat_clamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/seat_clamps/1
  # PUT /components/seat_clamps/1.xml
  def update
    @components_seat_clamp = Components::SeatClamp.find(params[:id])

    respond_to do |format|
      if @components_seat_clamp.update_attributes(params[:components_seat_clamp])
        format.html { redirect_to(@components_seat_clamp, :notice => 'Seat clamp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_seat_clamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/seat_clamps/1
  # DELETE /components/seat_clamps/1.xml
  def destroy
    @components_seat_clamp = Components::SeatClamp.find(params[:id])
    @components_seat_clamp.destroy

    respond_to do |format|
      format.html { redirect_to(components_seat_clamps_url) }
      format.xml  { head :ok }
    end
  end
end
