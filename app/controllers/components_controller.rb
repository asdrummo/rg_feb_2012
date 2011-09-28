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

  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new
    @component_select = 'true'
    list_components
     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @customer }
    end
  end
       
  def list_components
    @components = ['Bottom Bracket', 'Front Brake', 'Rear Brake', 'Chain', 'Chainring', 'Cog Cassette', 'Crank', 'Front Deraileur', 'Rear Deraileur', 'Fork', 'Grip', 'Half Link', 'Handlebar', 'Headset', 'Front Lever', 'Rear Lever', 'Pedal', 'Rim Strip', 'Saddle', 'Seat Clamp', 'Seat Post', 'Front Shifter', 'Rear Shifter', 'Stem', 'Front Tire', 'Rear Tire', 'Front Tube', 'Front Wheel', 'Rear Wheel']
    @components_array = @components.map { |component| [component, component] }
  end

  

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.xml
  def create
    if params[:component_type]
      @component = Component.new(params[:component])
      find_component(params[:component_type])
      @component_type = params[:component_type]
      @component_select = 'false'
      render 'new'
    else
    @component = Component.new(params[:component])
    @component_type = @component.component_type.to_s
    find_component(@component_type)
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
             @component.update_attributes(:image_path => ("components/defaults/" + @name.to_s + ".png"))
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
    elsif component_type == "Front Brake"
      @name = "front_brake"
    elsif component_type == 'Rear Brake'
      @name = "rear_brake"
    elsif component_type == 'Chain'
      name = "chain"
    elsif component_type == 'Chainring'
      @name = "chainring"
    elsif component_type == 'Cog Cassette'
      @name = "cog"
    elsif component_type == 'Crank'
      @name = "crank"
    elsif component_type == 'Front Deraileur'
      @name = "front_deraileur"
    elsif component_type == 'Rear Deraileur'
      @name = "rear_deraileur"
    elsif component_type == 'Fork'
      @name = "fork"
    elsif component_type == 'Grip'
      @name = "grip"
    elsif component_type == 'Half Link'
      @name = "half_link"
    elsif component_type == 'Handlebar'
      @name = "handlebar"
    elsif component_type == 'Headset'
      @name = "headset"
    elsif component_type == 'Front Lever'
      @name = "front_lever"
    elsif component_type == 'Rear Lever'
      @name = "rear_lever"
    elsif component_type == 'Pedal'
      @name = "pedal"
    elsif component_type == 'Rim Strip'
      @name = "rim_strip"
    elsif component_type == 'Saddle'
      @name = "saddle"
    elsif component_type == 'Seat Clamp'
      @name = "seat_clamp"
    elsif component_type == 'Seat Post'
      @name = "seat_post"
    elsif component_type == 'Front Shifter'
      @name = "front_shifter"
    elsif component_type == 'Rear Shifter'
      @name = "rear_shifter"
    elsif component_type == 'Stem'
      @name = "stem"
    elsif component_type == 'Front Tire'
      @name = "front_tire"
    elsif component_type == 'Rear Tire'
      @name = "rear_tire"
    elsif component_type == 'Front Tube'
      @name = "front_tube"
    elsif component_type == 'Rear Tube'
      @name = "rear_tube"
    elsif component_type == 'Front Wheel'
      @name = "front_wheel"
    elsif component_type == 'Rear Wheel'
      @name = "rear_wheel"
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
  
    def delete_photo
      @component = Component.find(params[:id])     
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
