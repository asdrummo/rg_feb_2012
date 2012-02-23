class ComponentsController < ApplicationController
  before_filter :confirm_logged_in
  before_filter :find_user
  layout 'admin'
  # GET /components
  # GET /components.xml
  def index
    list_components 

    if @user.privilege == "admin"
      if params[:type] && params[:type] != "all"
        @components = Component.find_all_by_component_type(params[:type])
      else
      @components = Component.all
      end
    else
      @components = Component.find_all_by_client_id(@user.client_id)

    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    if params[:photo]
      remove_photo
    else
      @component = Component.find(params[:id])
      if @user.client_id == @component.client_id
        @component = Component.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @component }
        end
      else
        render 'public/422.html'
      end
    end
  end

  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new
    @new_component = 'true'
    list_components
     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @component }
    end
  end
       
  def list_components
    @components = ['Bottom Bracket', 'Front Brake', 'Rear Brake', 'Chain', 'Chainring', 'Cog Cassette', 'Crank', 'Front Derailleur', 'Rear Derailleur', 'Fork', 'Grip', 'Half Link', 'Handlebar', 'Headset', 'Front Lever', 'Rear Lever', 'Pedal', 'Pedal Strap', 'Rim Strip', 'Saddle', 'Seat Clamp', 'Seat Post', 'Front Shifter', 'Rear Shifter', 'Stem', 'Front Tire', 'Rear Tire', 'Front Tube', 'Rear Tube', 'Front Wheel', 'Rear Wheel']
    @components_array = @components.map { |component| [component, component] }
  end

  

  # GET /components/1/edit
  def edit
    if params[:photo]
      remove_photo
    else
    @new_component = 'false'
    @component = Component.find(params[:id])
    @component_type = @component.component_type
    @compartment = @component.compartment
    @component_id = @component.id
    find_component(@component_type)
    end
  end

  # POST /components
  # POST /components.xml
  def create
    @new_component = 'false'
    if params[:component_type]
      @component = Component.new(params[:component])
      find_component(params[:component_type])
      @component_type = params[:component_type]
      render 'new'
    else
    @component = Component.new(params[:component])
    find_component(@component.component_type)
    @component_types = []
    respond_to do |format|
      if @component.save
        if @component.image_path.blank?
             @component.update_attributes(:image_path => ("components/defaults/" + @name.to_s + ".png"))
         end
        format.html { redirect_to(@component, :notice => 'Component was successfully created.') }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])
    @component_type = @component.component_type.to_s
    find_component(@component_type)
    respond_to do |format|
      if @component.update_attributes(params[:component])
        if @component.image_path.blank?
             @component.update_attributes(:image_path => ("components/defaults/" + @component.component_type.computerize + ".png"))
         end
        format.html { redirect_to(@component, :notice => 'Component was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  def find_component (component_type)
    if component_type == "Bottom Bracket"
      @name = "bottom_bracket"
      @compartment = 'drivetrain'
    elsif component_type == "Front Brake"
      @name = "front_brake"
      @compartment = 'front_end'
    elsif component_type == 'Rear Brake'
      @name = "rear_brake"
      @compartment = 'front_end'
    elsif component_type == 'Chain'
      @name = "chain"
      @compartment = 'drivetrain'
    elsif component_type == 'Chainring'
      @name = "chainring"
      @compartment = 'drivetrain'
    elsif component_type == 'Cog Cassette'
      @name = "cog"
      @compartment = 'drivetrain'
    elsif component_type == 'Crank'
      @name = "crank"
      @compartment = 'drivetrain'
    elsif component_type == 'Front Derailleur'
      @name = "front_derailleur"
      @compartment = 'drivetrain'
    elsif component_type == 'Rear Derailleur'
      @name = "rear_derailleur"
      @compartment = 'drivetrain'
    elsif component_type == 'Fork'
      @name = "fork"
      @compartment = 'front_end'
    elsif component_type == 'Grip'
      @name = "grip"
      @compartment = 'finishing'
    elsif component_type == 'Half Link'
      @name = "half_link"
      @compartment = 'finising'
    elsif component_type == 'Handlebar'
      @name = "handlebar"
      @compartment = 'front_end'
    elsif component_type == 'Headset'
      @name = "headset"
      @compartment = 'front_end'
    elsif component_type == 'Front Lever'
      @name = "front_lever"
      @compartment = 'front_end'
    elsif component_type == 'Rear Lever'
      @name = "rear_lever"
      @compartment = 'front_end'
    elsif component_type == 'Pedal'
      @name = "pedals"
      @compartment = 'finishing'
    elsif component_type == 'Pedal Strap'
      @name = "pedal_straps"
      @compartment = 'finishing'
    elsif component_type == 'Rim Strip'
      @name = "rim_strip"
      @compartment = 'wheels'
    elsif component_type == 'Saddle'
      @name = "saddle"
      @compartment = 'finishing'
    elsif component_type == 'Seat Clamp'
      @name = "seat_clamp"
      @compartment = 'finishing'
    elsif component_type == 'Seat Post'
      @name = "seat_post"
      @compartment = 'finishing'
    elsif component_type == 'Front Shifter'
      @name = "front_shifter"
      @compartment = 'front_end'
    elsif component_type == 'Rear Shifter'
      @name = "rear_shifter"
      @compartment = 'front_end'
    elsif component_type == 'Stem'
      @name = "stem"
      @compartment = 'front_end'
    elsif component_type == 'Front Tire'
      @name = "front_tire"
      @compartment = 'wheels'
    elsif component_type == 'Rear Tire'
      @name = "rear_tire"
      @compartment = 'wheels'
    elsif component_type == 'Front Tube'
      @name = "front_tube"
      @compartment = 'wheels'
    elsif component_type == 'Rear Tube'
      @name = "rear_tube"
      @compartment = 'wheels'
    elsif component_type == 'Front Wheel'
      @name = "front_wheel"
      @compartment = 'wheels'
    elsif component_type == 'Rear Wheel'
      @name = "rear_wheel"
      @compartment = 'wheels'
    end
  end
  
  
  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml  { head :ok }
    end
  end
  
  def remove_photo
    @component = Component.find(params[:component_id])     
    photo = Photo.find(params[:photo])
    deleted_photo_path = ("components/" + photo.id.to_s + "/original/"+ photo.data_file_name)
    if @component.image_path.to_s == deleted_photo_path.to_s
      @component.update_attributes(:image_path => "components/default.png")
    end
    if photo.destroy #Will queue the attachment to be deleted
      flash[:notice] = "photo deleted"
      redirect_to :back
    else 
      flash[:notice] = "nothing happened"
      redirect_to :back
    end
  end

    private 

  def find_user
    @user = User.find(session[:user_id])
  end


end
