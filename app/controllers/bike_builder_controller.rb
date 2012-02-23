class BikeBuilderController < ApplicationController
  layout 'standard'
  before_filter :confirm_logged_in
  before_filter :find_or_create_build 
  before_filter :find_frame
  before_filter :compatibility_check

  def frames
    @gear_select == 'false'
    #if params[:gears]
     # @gear_select = 'true'
      #@selected_gear = Gear.find(params[:gears]).name
      #respond_to do |format|
       # format.js { render 'custom_frame_specs.js' }
        #format.xml  { render :xml => @custom_frame_model.errors, :status => :unprocessable_entity }
      #end
    if params[:custom_frame_model]
      @build.empty_all_items
      @custom_frame_model = CustomFrameModel.new(params[:custom_frame_model])
     # if @custom_frame.save
      add_custom_frame_to_build
      #redirect_to(:action => 'drivetrain')
      #else
      flash[:notice] = 'your custom frame has been added to your build'
      respond_to do |format|
        format.html { redirect_to :action => "drivetrain" }
        format.xml  { render :xml => @custom_frame_model.errors, :status => :unprocessable_entity }
      end
    else
    
    frame_check
    #check_for_size_error
    @frames = FrameModel.find(:all, :order => 'name ASC') 
    @nav_id = 'frames'
    @model = 'active_progress'

    @frame_sizes = FrameModelSize.find(:all, :order => 'id ASC') 
    @top_tube_styles = TopTubeStyle.find(:all, :order => 'id ASC')
    check_compartment_completion
    #@custom_frame = FrameModel.new
    if params[:item] == 'custom_frame'
      if @custom_frame_build
        @custom_frame_model = @frame_model
      else
        @custom_frame_model = CustomFrameModel.new
      end
    @frame_specs = 'true'
    else
      @custom_frame_model = CustomFrameModel.new
    end
        #format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
        #format.js {render 'custom_frame.js'}  
      
     render 'bike_builder' 
    end
  end
 
  def submit_frame
    @frame = FrameModel.new(params[:frame_model])
    add_frame_to_build
    redirect_to(:action => 'drivetrain')
  end
  
  def add_frame_to_build
    if params[:id]
      frame = FrameModel.find(params[:id])
    elsif @drop_in_frame 
      @frame = @drop_in_frame
    end
    
    session[:build_frame] = @frame
    if @frame.gear_selection == nil
      gear = Gear.find(1)
      session[:gear_selection] = gear
    else
      gear = Gear.find(@frame.gear_selection)
      session[:gear] = gear
    end
    if @frame.top_tube_selection == nil
      top_tube_style = TopTubeStyle.find(1)
    else
      top_tube_style = TopTubeStyle.find(@frame.top_tube_selection)
      session[:top_tube_style] = top_tube_style
    end
    frame_size = FrameModelSize.find(@frame.size_selection)
    session[:frame_size] = frame_size
    if session[:build] != nil
       @build.empty_all_items
    end

    @build.add_frame_to_build(frame, frame_size, gear, top_tube_style, 'false')
    session[:build] = @build
  end
  
  def add_custom_frame_to_build
    frame = @custom_frame_model
    @frame_model = frame
    session[:build_frame] = frame
    if session[:build] != nil
       @build.empty_all_items
    end
    @build.add_custom_frame_to_build(frame)
    session[:build] = @build
  end
  
  def frame_check
    @frame = 'false'
    @frame_submit_text = 'add frame specs'
    @build.items.each do |item| 
      if item.custom_frame_model
        @custom_frame_build = 'true'
        @frame_submit_text = 'update frame'
        if (item.custom_frame_model.front_derailleur_mount == 'no') && 
          (item.custom_frame_model.rear_derailleur_mount == 'no')
          @speed = 'single'
          @drivetrain_type = 'drivetrain-single_speed'
          @front_end_type = 'front_end-single_speed'
          @front_derailleur = 'false'
          @rear_derailleur = 'false'
        elsif   (item.custom_frame_model.front_derailleur_mount == 'yes') && 
            (item.custom_frame_model.rear_derailleur_mount == 'no')
          @front_derailleur = 'true'
          @rear_derailleur = 'false'
          @speed = 'multi' 
        elsif   (item.custom_frame_model.front_derailleur_mount == 'no') && 
              (item.custom_frame_model.rear_derailleur_mount == 'yes')
          @front_derailleur = 'false'
          @rear_derailleur = 'true'
          @speed = 'multi' 
        else
          @front_derailleur = 'true'
          @rear_derailleur = 'true'
          @speed = 'multi'          
        end
        @frame = 'true'
      elsif item.frame_model
         @gear = Gear.find(item.gear)
         @frame = 'true'
      end
      if @gear
        @gear_selected = 'true'
        if @gear.num_gears == 1
          @speed = 'single'
          @drivetrain_type = 'drivetrain-single_speed'
          @front_end_type = 'front_end-single_speed'
        else
          @drivetrain_type = 'drivetrain-multi_speed'
          @front_end_type = 'front_end-multi_speed'
           @speed = 'multi'
        end
      end
    end
  end
  
  def drivetrain
    @nav_id = 'drivetrain'
    @drivetrain = 'active_progress'
    general_filters
  end
  
  def drivetrain_compatibility_check
    #set variables for arrays
    @incompatible_components = []
    
    ### CRANK ###
    #set crank error arrays
    @ck_error_chainring_num_bolts = []
    @ck_error_chainring_bcd = []
    @ck_error_bottom_bracket_taper = []
    @ck_error_frame_clearance = []
    #@ck_error_frame_qfactor = []
    
    if @components.where(:component_type => 'Crank').each do |component|
    
      if @chainring_selected 
      #chainring num_bolts
        if component.num_bolts != @chainring_selected.num_bolts
          @ck_error_chainring_num_bolts << component
          @incompatible_components << component
        end
      #chainring BCD
        if component.bcd != @chainring_selected.bcd
          @ck_error_chainring_bcd << component
          @incompatible_components << component
        end
      end
      
      #bottom bracket taper
      if @bottom_bracket_selected
        if component.taper != @bottom_bracket_selected.taper
          @ck_error_bottom_bracket_taper << component
          @incompatible_components << component
        end
      end
      
      #frame clearance
      #if @bottom_bracket_selected
       #  @bottom_bracket_clearance = (@bottom_bracket_selected.width/2) 
        # @bb_frame_required_clearance = (@frame_model.clearance - @bottom_bracket_clearance)
         # if component.qfactor < @bb_frame_required_clearance
          #  @ck_error_frame_clearance << component
           # @incompatible_components << component
          #end
      #end
      
    end #end loop for cranks
    end #end if statement for cranks

    ### BOTTOM BRACKET ###
    #set bottom bracket error arrays
    @bb_error_crank_taper = []
    @bb_error_frame_bb_width = []
    @bb_error_frame_bb_threading = []
    @bb_error_frame_bb_shell_width = []
    @bb_error_frame_clearance = []
    
    #bottom bracket filters
    if @components.where(:component_type => 'Bottom Bracket').each do |component|
      
      if @crank_selected 
      #crank taper
        if component.taper != @crank_selected.taper
          @bb_error_crank_taper << component
          @incompatible_components << component
        end
      end
      
      #frame filters 
      if @frame_model
      #frame bottom bracket width
      if component.width != @frame_model.bottom_bracket_width
        @bb_error_frame_bb_width << component
        @incompatible_components << component
      end
      
      #frame bottom bracket threading
      if component.threading != @frame_model.bottom_bracket_threading
        @bb_error_frame_bb_threading << component
        @incompatible_components << component
      end

      #frame bottom bracket shell width
      if component.shell_width != @frame_model.bottom_bracket_shell_width
        @bb_error_frame_bb_shell_width << component
        @incompatible_components << component
      end

      #frame clearance
     # if @crank_selected
      #   @required_clearance = (@frame_model.clearance - @crank_selected.qfactor)
       #  @bottom_bracket_clearance = (component.width)/2 
        #  if @bottom_bracket_clearance < @required_clearance
         #   @bb_error_frame_clearance << component
          #  @incompatible_components << component
        #  end
    #  end
      end #end frame filters for bottom bracket
    
    end
    end
  

    ### FRONT DERAILLEUR ###
    #set front derailleur error arrays
    @fd_error_crank_num_bolts = []
    @fd_error_chainring_num_bolts = []
    @fd_error_crank_bcd = []
    @fd_error_chainring_bcd = []
    @fd_error_chain_chain_width = []
    @fd_error_chainring_chain_width = []
    @fd_error_cog_chain_width = []
    @fd_error_crank_front_derailleur_type = []
    @fd_error_chainring_front_derailleur_type = []
    @fd_error_gears_front_derailleur_type = []    
    @fd_error_frame_front_derailleur_mount = []

    
    #front deraileur filters
    if @components.where(:component_type => 'Front Derailleur').where(['name != ?', 'No Front Deraileur']).each do |component|
      
      #crank filters
      if @crank_selected
        #crank number of bolts
        if component.num_bolts != @crank_selected.num_bolts
          @fd_error_crank_num_bolts << component
          @incompatible_components << component
        end
        #crank bcd
        if component.bcd != @crank_selected.bcd
          @fd_error_crank_bcd << component
          @incompatible_components << component
        end     
        # crank front derailleur type
        if component.front_derailleur_type != @crank_selected.front_derailleur_type
          @fd_error_crank_front_derailleur_type << component
          @incompatible_components << component
        end 
        
      end 
      
      #chainring filters
      if @chainring_selected
        #chainring number of bolts
        if component.num_bolts != @chainring_selected.num_bolts
          @fd_error_chainring_num_bolts << component
          @incompatible_components << component
        end
        
        #chainring bcd
        if component.bcd != @chainring_selected.bcd
          @fd_error_chainring_bcd << component
          @incompatible_components << component
        end
        
        #chainring chain width
        if component.chain_width != @chainring_selected.chain_width
          @fd_error_chainring_chain_width << component
          @incompatible_components << component
        end
        #chainring front deraileur type
        if component.front_derailleur_type != @chainring_selected.front_derailleur_type
          @fd_error_chainring_front_derailleur_type << component
          @incompatible_components << component
        end
      end 
      
      #chain chain width 
      if @chain_selected
        if component.chain_width != @chain_selected.chain_width
          @fd_error_chain_chain_width << component
          @incompatible_components << component
        end
      end
      
      #cog cassette chain width 
      if @cog_selected
        if component.chain_width != @cog_selected.chain_width
          @fd_error_cog_chain_width << component
          @incompatible_components << component
        end
      end
      
      #gears front derailleur type
      if @gear
        if component.front_derailleur_type != @gear.front_derailleur_type
          @fd_error_gears_front_derailleur_type << component
          @incompatible_components << component
          @gear_selected_front_derailleur_type = @gear.front_derailleur_type
        end
      end
      
      #frame front derailleur mount
      if @frame_model
        if component.front_derailleur_mount != @frame_model.front_derailleur_mount
          @fd_error_frame_front_derailleur_mount << component
          @incompatible_components << component
        end
      end
      
    end
    end
    
    ### CHAINRING ###
    #set chainring error arrays
    @cr_error_crank_num_bolts = []
    @cr_error_chain_chain_width = []
    @cr_error_front_derailleur_type = []
    
    #chainring filters
      if @components.where(:component_type => 'Chainring').each do |component|
      
        #crank number of bolts
        if @crank_selected
          if component.num_bolts != @crank_selected.num_bolts
            @cr_error_crank_num_bolts << component
            @incompatible_components << component
            @chainring_num_bolts = component.num_bolts
            @crank_selected_num_bolts = @crank_selected.num_bolts
          end
        end
        
        #chain chain width
        if @chain_selected
          if component.chain_width != @chain_selected.chain_width
            @cr_error_chain_chain_width << component
            @incompatible_components << component
            @chainring_chain_width = component.chain_width
            @chain_selected_chain_width = @chain_selected.chain_width
          end
        end
        
        #front deraileur type
        if @front_derailleur_selected
          if component.front_derailleur_type != @front_derailleur_selected.front_derailleur_type
            @cr_error_front_derailleur_type << component
            @incompatible_components << component
            @chainring_front_derailleur_type = component.front_derailleur_type
            @front_derailleur_selected_type = @front_derailleur_selected.front_derailleur_type
          end
        end  
      end
      end
  	
    ### REAR DERAILLEUR ###
    #set rear derailleur error arrays
    @rd_error_frame_rear_derailleur_mount = []
    @rd_error_gears_rear_derailleur_type = []
    #@rear_shifter_rear_derailleur_shifter_type = []
    @rd_error_cog_cassette_cog_number = []
    @rd_error_cog_cassette_chain_width = []
    @rd_error_chain_chain_width = []
    
    #rear derailleur filters
      if @components.where(:component_type => 'Rear Derailleur').each do |component|
      
        #frame rear derailleur mount
        if @frame_model
          if component.rear_derailleur_mount != @frame_model.rear_derailleur_mount
            @rd_error_frame_rear_derailleur_mount << component
            @incompatible_components << component
          end
        end
        
        #gears rear derailleur type
        #leaving this blank for now. possible to add a column 'num_gears' for rear deraileur?
        
        #rear wheel cog spline thread type
        #unapplicable since wheel always gets picked after drivetrain        
        
        #cog cassette cog number
        if @cog_selected
          if component.cog_number != @cog_selected.cog_number
            @rd_error_cog_cassette_cog_number << component
            @incompatible_components << component
          end
          #cog cassette chain width
          if component.chain_width != @cog_selected.chain_width
            @rd_error_cog_cassette_chain_width << component
            @incompatible_components << component
          end
        end
        
        #chain chain width
        if @chain_selected
          if component.chain_width != @chain_selected.chain_width
            @rd_error_chain_chain_width << component
            @incompatible_components << component
          end
        end
        
      end
      end    
    
    ### COG ###
    #set cog casette error arrays
    @cg_error_chain_chain_width = []
    #@rear_wheel_cog_spline = []
    @cg_error_rear_derailleur_type = []
    
    #cog cassette filters
      if @components.where(:component_type => 'Cog Cassette').each do |component|
        
      #rear wheel cog spline thread type
      #unapplicable since wheel always gets picked after drivetrain
      
      #rear derailleur type
      if @rear_derailleur_selected
        if component.rear_derailleur_type != @rear_derailleur_selected.rear_derailleur_type
          @cg_error_rear_derailleur_type << component
          @incompatible_components << component
        end
      end
      
      #chain chain width
        if @chain_selected
          if component.chain_width != @chain_selected.chain_width
            @cg_error_chain_chain_width << component
            @incompatible_components << component
          end
        end
  
      end 
      end

    ### CHAINS ###
    #set chain error arrays
    @cn_error_chainring_chain_width = []
    @cn_error_rear_derailleur_chain_width = []
    @cn_error_cog_number = []
    
    #chain filters
      if @components.where(:component_type => 'Chain').each do |component|
       
        #chainring chain width
        if @chainring_selected
          if component.chain_width != @chainring_selected.chain_width
            @cn_error_chainring_chain_width << component
            @incompatible_components << component
          end
        end
        
        #rear derailleur chain width
        if @rear_derailleur_selected
          if component.component_type == 'Chain' && component.chain_width != @rear_derailleur_selected.chain_width
            @cn_error_rear_derailleur_chain_width << component
            @incompatible_components << component
          end
        end
        
        #cog cassette number
        if @cog_selected
          if component.component_type == 'Chain' && component.cog_number != @cog_selected.cog_number
            @cn_error_cog_number << component
            @incompatible_components << component
          end
        end

      end #end loop
      end #end if statement
      
      ###REMOVE INCOMPATIBLE COMPONENTS FROM COMPONENTS!###
      #remove incompatible components
      @incompatible_components.uniq! 
      if @incompatible_components.empty?
      else
      @components = @components.incompatible(@incompatible_components) 
      end
  end #end action
 
  def general_filters
    custom_component_select_or_add
    reset_compartments
    frame_check
    check_compartment_completion
    list_components
    if @nav_id == 'drivetrain'
      @compartment_components = @drivetrain_components
    elsif @nav_id == 'front_end'
      @compartment_components = @front_end_components
    elsif @nav_id == 'wheels'
      @compartment_components = @wheel_components
    elsif @nav_id == 'finishing'
      @compartment_components = @finishing_components
    end
    components_per_page
    if @nav_id == 'wheels' || @nav_id == 'finishing'
      @component_packages = ComponentPackage.where(:package_type => @nav_id) #.order(:order => 'created_at ASC')
    else
      @component_packages = ComponentPackage.where(:package_type => @nav_id + '-' + @speed + '_speed') #.order(:order => 'created_at ASC')
    end
    #filter for component type 
    if params[:type] && (params[:type] != 'all')
      @component_type = params[:type]
      @component = params[:type]
      @components = Component.where(:component_type => @component_type)
    
    #filter for components by package
     elsif params[:package_id]
       find_package_components
       @component = @package.name
      #@component = @package.name

    #all compartment components
    elsif params[:type] == 'all'
      @components = Component.where(:compartment => @nav_id)
    else
      #@component_type = 'none'
      @component = @nav_id.titleize + 'Components'
      @components = Component.where(:compartment => @nav_id)
    end
    #filter for single speed
    if @speed == 'single'
        @components = @components.where('component_type != ? AND component_type != ? AND component_type != ? AND component_type != ?', 'Rear Derailleur', 'Front Derailleur', 'Rear Shifter', 'Front Shifter')
        #@components = @components - @derailleur_components
    end
    compatibility_check
    if @compatibility_check == 'on'
      if @nav_id == 'drivetrain' 
        drivetrain_compatibility_check
      elsif @nav_id == 'front_end'
        front_end_compatibility_check
      elsif @nav_id == 'wheels'
        wheels_compatibility_check
      elsif @nav_id == 'finishing'
        finishing_compatibility_check
      end
    end  
    
    #checkmark arrays
    @compartment_build = []
    @package_build = []
    @build.items.each do |item|
      if item.compartment == @nav_id
        @compartment_build << item
      end
      
      if item.component_package
        @package_build << item
        @package = ComponentPackage.find(item.component_package.id)
        find_package_components
      end
    end
    component_sort
  end
  
  def package_table
    @nav_id = params[:package_id]
    compartment = params[:package_id]
    frame_check
    if @nav_id == 'wheels' || @nav_id == 'finishing'
      @component_packages = ComponentPackage.where(:package_type => @nav_id) #.order(:order => 'created_at ASC')
    else
      @component_packages = ComponentPackage.where(:package_type => @nav_id + '-' + @speed + '_speed') #.order(:order => 'created_at ASC')
    end
    respond_to do |format|
        format.html {render @nav_id}
        format.js { render 'packages.js'}
        format.xml  { render :xml => @custom_frame_model.errors, :status => :unprocessable_entity }
    end
  end
  
  def front_end
    @nav_id = 'front_end'
    @front_end = 'active_progress'
    general_filters
  end
  
  def front_end_compatibility_check
    #set variables for arrays
    @incompatible_components = []
    
    ### FORK ###
    #set fork error arrays
    @fk_error_frame_front_wheel_size = []
    @fk_error_frame_front_brake_type = []
    @fk_error_frame_steer_tube_length = []
    @fk_error_stem_steer_tube_diameter = []
    @fk_error_headset_steer_tube_diameter = []
    @fk_error_front_brake_type = []
    #@fk_error_front_wheel_front_hub_width = []
    #@fk_error_front_tire_max_tire_width = []
    #@fk_error_front_tire_max_tire_size = []
    
    if @components.where(:component_type => 'Fork').each do |component|
    
      if @frame_model
      #frame wheel size
        if component.wheel_size != @frame_model.front_wheel_size.to_s
          @fk_error_frame_front_wheel_size << component
          @incompatible_components << component
        end
      #frame front brake type
        if component.brake_type != @frame_model.front_brake_type
          @fk_error_frame_front_brake_type << component
          @incompatible_components << component
        end      
      #frame steer tube length
        if component.steer_tube_length != @frame_model.steer_tube_length
          @fk_error_frame_steer_tube_length << component
          @incompatible_components << component
        end        
      end #end frame
      
      #stem steer tube diameter
      if @stem_selected
        if component.steer_tube_diameter != @stem_selected.steer_tube_diameter
          @fk_error_stem_steer_tube_diameter << component
          @incompatible_components << component
        end
      end #end stem
      
      #headset steer tube diameter
      if @headset_selected
        if component.steer_tube_diameter != @headset_selected.steer_tube_diameter
          @fk_error_headset_steer_tube_diameter << component
          @incompatible_components << component
        end
      end #end stem
      
      #front brake front brake type 
      if @front_brake_selected 
        if component.brake_type != @front_brake_selected.brake_type
          @fk_error_front_brake_type << component
          @incompatible_components << component
        end
      end #end front brake
    end #end fork loop
    end #end fork if
    
    ### HEADSET ###
    #set headset error arrays
    @hs_error_frame_head_tube_inner_diameter = []
    @hs_error_fork_steer_tube_diameter = []
    @hs_error_fork_crown_race_diameter = []
    
    if @components.where(:component_type => 'Headset').each do |component|

     if @frame_model
      #frame head tube inner diameter
    #    if (component.head_tube_inner_diameter > (@frame_model.head_tube_inner_diameter + 1)) ||
     #     (component.head_tube_inner_diameter < (@frame_model.head_tube_inner_diameter - 1))
      #    @hs_error_frame_head_tube_inner_diameter << component
       #   @incompatible_components << component
      #  end
      end
      
      if @fork_selected
      #fork steer tube diameter
        if component.steer_tube_diameter != @fork_selected.steer_tube_diameter
          @hs_error_fork_steer_tube_diameter << component
          @incompatible_components << component
        end
      #fork crown race diameter
        if component.crown_race_diameter != @fork_selected.crown_race_diameter
          @hs_error_fork_crown_race_diameter << component
          @incompatible_components << component
        end
      end  
    
    end #end headset loop
    end #end headset if statement
    
    ### STEM ###
    #set stem error arrays
    @st_error_fork_steer_tube_diameter = []
    @st_error_fork_steer_tube_inner_diameter = []
    @st_error_handlebar_stem_clamp_diameter_high = []
    @st_error_handlebar_stem_clamp_diameter_low = []
    
    if @components.where(:component_type => 'Headset').each do |component|
      
      if @fork_selected
      #fork steer tube diameter
        if component.steer_tube_diameter != @fork_selected.steer_tube_diameter
          @st_error_fork_steer_tube_diameter << component
          @incompatible_components << component
        end
      #fork steer tube inner diameter
        if component.steer_tube_inner_diameter != @fork_selected.steer_tube_inner_diameter
          @st_error_fork_steer_tube_inner_diameter << component
          @incompatible_components << component
        end
      end  
      
      if @handlebar_selected
        #stem clamp diameter high
     #   if component.clamp_diameter_high < @handlebar_selected.clamp_diameter_high
      #    @st_error_handlebar_stem_clamp_diameter_high << component
       #   @incompatible_components << component
      #  end
        #stem clamp diameter low
     #   if component.clamp_diameter_low > @handlebar_selected.clamp_diameter_low
      #    @st_error_handlebar_stem_clamp_diameter_low << component
       #   @incompatible_components << component
      #  end
      end      
    end #end headset loop
    end #end headset if statement
    
    ### FRONT SHIFTER ###
    #set front shifter error arrays
    @fs_error_front_derailleur_type = []
    @fs_error_handlebar_clamp_diameter_low = []
    @fs_error_handlebar_clamp_diameter_high = []
    @fs_error_handlebar_type = []
    @fs_error_handlebar_max_turn_size = []
    
    if @components.where(:component_type => 'Front Shifter').each do |component|
      if @front_derailleur_selected
      #front derailleur type
        if component.front_derailleur_type != @front_derailleur_selected.front_derailleur_type
          @fs_error_front_derailleur_type << component
          @incompatible_components << component
        end # end front derailleur filters
      end
      if @handlebar_selected
        #handlebar clamp diameter low
     #   if component.clamp_diameter_low > @handlebar_selected.clamp_diameter_low
      #    @fs_error_handlebar_clamp_diameter_low << component
       #   @incompatible_components << component
    #    end
        #handlebar clamp diameter high
     #   if component.clamp_diameter_high < @handlebar_selected.clamp_diameter_high
      #    @fs_error_handlebar_clamp_diameter_high << component
      #   @incompatible_components << component
      #  end
        #handlebar type
        if component.handlebar_type != @handlebar_selected.handlebar_type
          @fs_error_handlebar_type << component
          @incompatible_components << component
        end
        #handlebar max turn diameter
  #      if component.max_turn_size > @handlebar_selected.max_turn_size
   #       @fs_error_handlebar_max_turn_size << component
    #      @incompatible_components << component
     #   end
      end # end handlebar filters
    
    end # end front shifter loop
    end # end front shifter if statement
    
    ### REAR SHIFTER ###
    #set rear shifter error arrays
    @rs_error_rear_derailleur_type = []
    @rs_error_handlebar_clamp_diameter_low = []
    @rs_error_handlebar_clamp_diameter_high = []
    @rs_error_handlebar_type = []
    @rs_error_handlebar_max_turn_size = []
    
    if @components.where(:component_type => 'Rear Shifter').each do |component|
      if @rear_derailleur_selected
      #rear derailleur type
        if component.rear_derailleur_type != @rear_derailleur_selected.rear_derailleur_type
          @rs_error_rear_derailleur_type << component
          @incompatible_components << component
        end # end rear derailleur filters
      end
      if @handlebar_selected
        #handlebar clamp diameter low
   #     if component.clamp_diameter_low > @handlebar_selected.clamp_diameter_low
    #      @rs_error_handlebar_clamp_diameter_low << component
     #     @incompatible_components << component
      #  end
 #       #handlebar clamp diameter high
  #      if component.clamp_diameter_high < @handlebar_selected.clamp_diameter_high
   #       @rs_error_handlebar_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
        #handlebar type
        if component.handlebar_type != @handlebar_selected.handlebar_type
          @rs_error_handlebar_type << component
          @incompatible_components << component
        end
        #handlebar max turn diameter
  #      if component.max_turn_size > @handlebar_selected.max_turn_size
   #       @rs_error_handlebar_max_turn_size << component
    #      @incompatible_components << component
     #   end
      end # end handlebar filters
    
    end # end rear shifter loop
    end # end rear shifter if statement

    ### FRONT LEVER ###
    #set front lever error arrays
    @fl_error_front_brake_type = [] 
    @fl_error_front_brake_pull = [] 
    @fl_error_handlebar_clamp_diameter_low = []
    @fl_error_handlebar_clamp_diameter_high = []
    @fl_error_handlebar_type = []
    @fl_error_handlebar_max_turn_size = [] 
    
    if @components.where(:component_type => 'Front Lever').each do |component|
      
      if @front_brake_selected
        #front brake type
    #    if component.brake_type > @front_brake_selected.brake_type
     #     @fl_error_front_brake_type << component
      #    @incompatible_components << component
    #    end 
        #front brake pull
    #    if component.brake_pull > @front_brake_selected.brake_pull
     #     @fl_error_front_brake_pull << component
      #    @incompatible_components << component
  #      end
      end
      
      if @handlebar_selected
        #handlebar clamp diameter low
   #     if component.clamp_diameter_low > @handlebar_selected.clamp_diameter_low
    #      @fl_error_handlebar_clamp_diameter_low << component
     #     @incompatible_components << component
      #  end
        #handlebar clamp diameter high
  #      if component.clamp_diameter_high < @handlebar_selected.clamp_diameter_high
   #       @fl_error_handlebar_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
        #handlebar type
        if component.handlebar_type != @handlebar_selected.handlebar_type
          @fl_error_handlebar_type << component
          @incompatible_components << component
        end
        #handlebar max turn diameter
  #      if component.max_turn_size > @handlebar_selected.max_turn_size
   #       @fl_error_handlebar_max_turn_size << component
    #      @incompatible_components << component
     #   end
      end # end handlebar filters
    
    end # end front lever loop
    end # end front lever if statement       
    
    ### REAR LEVER ###
    #set rear lever error arrays
    @rl_error_rear_brake_type = [] 
    @rl_error_rear_brake_pull = [] 
    @rl_error_handlebar_clamp_diameter_low = []
    @rl_error_handlebar_clamp_diameter_high = []
    @rl_error_handlebar_type = []
    @rl_error_handlebar_max_turn_size = [] 
    
    if @components.where(:component_type => 'Rear Lever').each do |component|
      
      if @rear_brake_selected
        #rear brake type
   #     if component.brake_type > @rear_brake_selected.brake_type
    #      @rl_error_rear_brake_type << component
     #     @incompatible_components << component
      #  end 
        #rear brake pull
  #      if component.brake_pull > @rear_brake_selected.brake_pull
   #       @rl_error_rear_brake_pull << component
    #      @incompatible_components << component
     #   end
      end
      
      if @handlebar_selected
        #handlebar clamp diameter low
  #      if component.clamp_diameter_low > @handlebar_selected.clamp_diameter_low
   #       @rl_error_handlebar_clamp_diameter_low << component
    #      @incompatible_components << component
     #   end
        #handlebar clamp diameter high
  #      if component.clamp_diameter_high < @handlebar_selected.clamp_diameter_high
   #       @rl_error_handlebar_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
        #handlebar type
        if component.handlebar_type != @handlebar_selected.handlebar_type
          @rl_error_handlebar_type << component
          @incompatible_components << component
        end
        #handlebar max turn diameter
 #       if component.max_turn_size > @handlebar_selected.max_turn_size
  #        @rl_error_handlebar_max_turn_size << component
   #       @incompatible_components << component
    #    end
      end # end handlebar filters
    
    end # end rear lever loop
    end # end rear lever if statement    

    ### HANDLEBAR ###
    #set handlebar error arrays
    @hb_error_stem_clamp_diameter_high = [] 
    @hb_error_front_lever_clamp_diameter_high = [] 
    @hb_error_front_lever_clamp_diameter_low = [] 
    @hb_error_front_lever_handlebar_type = [] 
    @hb_error_front_lever_max_turn_size = [] 
    @hb_error_rear_lever_clamp_diameter_high = [] 
    @hb_error_rear_lever_clamp_diameter_low = [] 
    @hb_error_rear_lever_handlebar_type = [] 
    @hb_error_rear_lever_max_turn_size = []
    @hb_error_front_shifter_clamp_diameter_high = []
    @hb_error_front_shifter_clamp_diameter_low = [] 
    @hb_error_front_shifter_handlebar_type = [] 
    @hb_error_front_shifter_max_turn_size = []
    @hb_error_rear_shifter_clamp_diameter_high = []
    @hb_error_rear_shifter_clamp_diameter_low = [] 
    @hb_error_rear_shifter_handlebar_type = [] 
    @hb_error_rear_shifter_max_turn_size = []
    
    if @components.where(:component_type => 'Handlebar').each do |component|
      
      if @stem_selected
        #stem clamp diameter high
  #      if component.clamp_diameter_high > @stem_selected.clamp_diameter_high
   #       @hb_error_stem_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
      end

      if @front_lever_selected
        # front lever clamp diameter high
  #      if component.clamp_diameter_low > @front_lever_selected.clamp_diameter_low
   #       @hb_error_front_lever_clamp_diameter_low << component
    #      @incompatible_components << component
     #   end
        #front lever clamp diameter high
 #       if component.clamp_diameter_high < @front_lever_selected.clamp_diameter_high
  #        @hb_error_front_lever_clamp_diameter_high << component
   #       @incompatible_components << component
    #    end
        #front lever type
        if component.handlebar_type != @front_lever_selected.handlebar_type
          @hb_error_front_lever_handlebar_type << component
          @incompatible_components << component
        end
        #front lever max turn diameter
 #       if component.max_turn_size > @front_lever_selected.max_turn_size
  #        @hb_error_front_lever_max_turn_size << component
   #       @incompatible_components << component
    #    end
      end
      
      if @rear_lever_selected
        # rear lever clamp diameter high
 #       if component.clamp_diameter_low > @rear_lever_selected.clamp_diameter_low
  #        @hb_error_rear_lever_clamp_diameter_low << component
   #       @incompatible_components << component
    #    end
        #rear lever clamp diameter high
 #       if component.clamp_diameter_high < @rear_lever_selected.clamp_diameter_high
  #        @hb_error_rear_lever_clamp_diameter_high << component
   #       @incompatible_components << component
    #    end
        #rear lever type
        if component.handlebar_type != @rear_lever_selected.handlebar_type
          @hb_error_rear_lever_handlebar_type << component
          @incompatible_components << component
        end
        #rear lever max turn diameter
 #       if component.max_turn_size > @rear_lever_selected.max_turn_size
  #        @hb_error_rear_lever_max_turn_size << component
   #       @incompatible_components << component
    #    end
      end

      if @front_shifter_selected
        # front shifter clamp diameter high
 #       if component.clamp_diameter_low > @front_shifter_selected.clamp_diameter_low
  #        @hb_error_front_shifter_clamp_diameter_low << component
   #       @incompatible_components << component
    #    end
        #front shifter clamp diameter high
  #      if component.clamp_diameter_high < @front_shifter_selected.clamp_diameter_high
   #       @hb_error_front_shifter_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
        #front shifter type
        if component.handlebar_type != @front_shifter_selected.handlebar_type
          @hb_error_front_shifter_handlebar_type << component
          @incompatible_components << component
        end
        #front shifter max turn diameter
  #      if component.max_turn_size > @front_shifter_selected.max_turn_size
   #       @hb_error_front_shifter_max_turn_size << component
    #      @incompatible_components << component
     #   end
      end
      
      if @rear_shifter_selected
        # rear shifter clamp diameter high
 #       if component.clamp_diameter_low > @rear_shifter_selected.clamp_diameter_low
  #        @hb_error_rear_shifter_clamp_diameter_low << component
   #       @incompatible_components << component
    #    end
        #rear shifter clamp diameter high
  #      if component.clamp_diameter_high < @rear_shifter_selected.clamp_diameter_high
   #       @hb_error_rear_shifter_clamp_diameter_high << component
    #      @incompatible_components << component
     #   end
        #rear shifter type
        if component.handlebar_type != @rear_shifter_selected.handlebar_type
          @hb_error_rear_shifter_handlebar_type << component
          @incompatible_components << component
        end
        #rear shifter max turn diameter
  #      if component.max_turn_size > @rear_shifter_selected.max_turn_size
   #       @hb_error_rear_shifter_max_turn_size << component
    #      @incompatible_components << component
     #   end
      end

    end # end handlebar loop
    end # end handlebar if statement

    ### FRONT BRAKE ###
    #set front brake error arrays
    #@fb_error_front_wheel_size = [] 
    #@fb_error_front_wheel_rim_width = [] 
    #@fb_error_front_tire_size = [] 
    #@fb_error_front_tire_width = [] 
    @fb_error_frame_front_brake_type = [] 
    @fb_error_front_lever_brake_pull = []
    @fb_error_front_lever_brake_type = []  
    @fb_error_fork_front_brake_type = []
    @fb_error_fork_front_brake_pull = []
   # @fb_error_fork_brake_mount_high = []
   # @fb_error_fork_brake_mount_low = []
    
    
  
    if @components.where(:component_type => 'Front Brake').each do |component|
      
      if @frame_model
        #frame front brake type
        if component.brake_type != @frame_model.front_brake_type
          @fb_error_frame_front_brake_type << component
          @incompatible_components << component
        end
      end
      
      if @front_lever_selected
        #front lever brake type
          if component.brake_type != @front_lever_selected.brake_type
            @fb_error_front_lever_brake_type << component
            @incompatible_components << component
          end
          
        #front lever brake pull
          if component.brake_pull != @front_lever_selected.brake_pull
            @fb_error_front_lever_brake_pull << component
            @incompatible_components << component
          end
      end
      
      if @fork_selected
        #fork brake type
          if component.brake_type != @fork_selected.brake_type
            @fb_error_fork_front_brake_type << component
            @incompatible_components << component
          end
      end  



    end # end front brake loop
    end # end front brake if statement
    
    ### Rear BRAKE ###
    #set front brake error arrays
    #@rb_error_front_wheel_size = [] 
    #@rb_error_front_wheel_rim_width = [] 
    #@rb_error_front_tire_size = [] 
    #@rb_error_front_tire_width = [] 
    @rb_error_frame_rear_brake_type = [] 
    @rb_error_rear_lever_brake_pull = [] 
    
    if @components.where(:component_type => 'Rear Brake').each do |component|
      
      if @frame_model
        #frame rear brake type
        if component.brake_type != @frame_model.rear_brake_type
          @rb_error_frame_rear_brake_type << component
          @incompatible_components << component
        end
      end
      
      if @rear_lever_selected
        #rear lever brake pull
          if component.brake_pull != @rear_lever_selected.brake_pull
            @rb_error_rear_lever_brake_pull << component
            @incompatible_components << component
          end
      end
    	
    end # end rear brake loop
    end # end rear brake if statement

    ###REMOVE INCOMPATIBLE FRONT END COMPONENTS FROM COMPONENTS!###
    #remove incompatible components
    @incompatible_components.uniq! 
    if @incompatible_components.empty?
    else
    @components = @components.incompatible(@incompatible_components) 
    end
  end
  
  def wheels
    @nav_id = 'wheels'
    @wheels = 'active_progress'   
    general_filters
  end

  def wheels_compatibility_check
    #set variables for arrays
    @incompatible_components = []
    
    ### FRONT TIRE ###
    #set front tire error arrays
    @fti_error_front_tube_tire_size = [] 
    @fti_error_front_tube_tire_width = [] 
    @fti_error_front_tube_wheel_size = [] 
    @fti_error_front_wheel_rim_width = [] 
    
    
    if @components.where(:component_type => 'Front Tire').each do |component|
      
  
      if @front_tube_selected
        #front tube tire size & front tire wheel size
          if component.tire_size != @front_tube_selected.tire_size
            @fti_error_front_tube_tire_size << component
            @incompatible_components << component
          end
        #front tube tire width
           if component.tire_width != @front_tube_selected.tire_width
             @fti_error_front_tube_tire_width << component
             @incompatible_components << component
           end
      end
      
      if @front_wheel_selected
        #front wheel size
          if component.wheel_size != @front_wheel_selected.wheel_size
            @fti_error_front_tube_wheel_size << component
            @incompatible_components << component
          end
        #front wheel rim width
           if component.rim_width != @front_wheel_selected.rim_width
             @fti_error_front_wheel_rim_width << component
             @incompatible_components << component
           end
      end
      
      if @front_brake_selected
        #front brake tire max width & front tire width 
          if component.tire_width != @front_brake_selected.tire_max_width
            @fti_error_front_brake_tire_max_width << component
            @incompatible_components << component
          end
        #front wheel tire max size & front tire size
           if component.tire_size != @front_brake_selected.tire_max_size
             @fti_error_front_wheel_tire_max_size << component
             @incompatible_components << component
           end
      end
      
    end # end front tire loop
    end # end front tire if statement

    ### FRONT TUBE ###
    #set front tube error arrays
    @ftu_error_front_wheel_size = [] 
    @ftu_error_front_wheel_rim_width = [] 
    @ftu_error_front_wheel_size = [] 
    @ftu_error_front_tire_width = [] 
    
    
    if @components.where(:component_type => 'Front Tube').each do |component|
      
      if @front_wheel_selected
        #front wheel size
          if component.wheel_size != @front_wheel_selected.wheel_size
            @ftu_error_front_wheel_size << component
            @incompatible_components << component
          end
        #front wheel rim width
           if component.rim_width != @front_wheel_selected.rim_width
             @ftu_error_front_wheel_rim_width << component
             @incompatible_components << component
           end
      end

      if @front_tire_selected
        #front tire wheel size & front tube tire size
          if component.tire_size != @front_tire_selected.tire_size
            @ftu_error_front_wheel_size << component
            @incompatible_components << component
          end
        #front tire width
           if component.tire_width != @front_tire_selected.tire_width
             @ftu_error_front_tire_width << component
             @incompatible_components << component
           end
      end
      
    end # end front tube loop
    end # end front tube if statement

    ### FRONT WHEEL ###
    #set front tube error arrays
    @fw_error_fork_hub_width = [] 
    @fw_error_front_tire_wheel_size = [] 
    @fw_error_front_tire_rim_width = [] 
    @fw_error_front_brake_type = [] 
    @fw_error_front_tube_wheel_size = [] 
    @fw_error_front_tube_rim_width = []
    
    if @components.where(:component_type => 'Front Wheel').each do |component|
      
      if @fork_selected
        #fork hub width
          if component.hub_width != @fork_selected.hub_width
            @fw_error_fork_hub_width << component
            @incompatible_components << component
          end
      end

      if @front_tire_selected
        #front tire wheel size
          if component.wheel_size != @front_tire_selected.wheel_size
            @fw_error_front_tire_wheel_size << component
            @incompatible_components << component
          end
        #front tire rim width
           if component.rim_width != @front_tire_selected.rim_width
             @fw_error_front_tire_rim_width << component
             @incompatible_components << component
           end
      end
      
      if @front_brake_selected
        #front brake type
          if component.brake_type != @front_brake_selected.brake_type
            @fw_error_front_brake_type << component
            @incompatible_components << component
          end
      end
      
      if @front_tube_selected
        #front tube wheel size
          if component.wheel_size != @front_tube_selected.wheel_size
            @fw_error_front_tube_wheel_size << component
            @incompatible_components << component
          end
        #front tube rim width
           if component.rim_width != @front_tube_selected.rim_width
             @fw_error_front_tube_rim_width << component
             @incompatible_components << component
           end
      end

    end # end front wheel loop
    end # end front wheel if statement    

    ### REAR TIRE ###
    #set rear tire error arrays
    @rti_error_rear_tube_tire_size = [] 
    @rti_error_rear_tube_tire_width = [] 
    @rti_error_rear_tube_wheel_size = [] 
    @rti_error_rear_wheel_rim_width = [] 
    
    
    if @components.where(:component_type => 'Rear Tire').each do |component|
      
  
      if @rear_tube_selected
        #rear tube tire size & rear tire wheel size
          if component.tire_size != @rear_tube_selected.tire_size
            @rti_error_rear_tube_tire_size << component
            @incompatible_components << component
          end
        #rear tube tire width
           if component.tire_width != @rear_tube_selected.tire_width
             @rti_error_rear_tube_tire_width << component
             @incompatible_components << component
           end
      end
      
      if @rear_wheel_selected
        #rear wheel size
          if component.wheel_size != @rear_wheel_selected.wheel_size
            @rti_error_rear_tube_wheel_size << component
            @incompatible_components << component
          end
        #rear wheel rim width
           if component.rim_width != @rear_wheel_selected.rim_width
             @rti_error_rear_wheel_rim_width << component
             @incompatible_components << component
           end
      end

    end # end rear tire loop
    end # end rear tire if statement

    ### REAR WHEEL ###
    #set rear tube error arrays
    @rw_error_rear_tire_wheel_size = [] 
    @rw_error_rear_tire_rim_width = [] 
    @rw_error_rear_brake_type = [] 
    @rw_error_rear_tube_wheel_size = [] 
    @rw_error_rear_tube_rim_width = []
    
    if @components.where(:component_type => 'Rear Wheel').each do |component|

      if @rear_tire_selected
        #rear tire wheel size
          if component.wheel_size != @rear_tire_selected.wheel_size
            @rw_error_rear_tire_wheel_size << component
            @incompatible_components << component
          end
        #rear tire rim width
           if component.rim_width != @rear_tire_selected.rim_width
             @rw_error_rear_tire_rim_width << component
             @incompatible_components << component
           end
      end
      
      if @rear_brake_selected
        #rear brake type
          if component.brake_type != @rear_brake_selected.brake_type
            @rw_error_rear_brake_type << component
            @incompatible_components << component
          end
      end
      
      if @rear_tube_selected
        #rear tube wheel size
          if component.wheel_size != @rear_tube_selected.wheel_size
            @rw_error_rear_tube_wheel_size << component
            @incompatible_components << component
          end
        #rear tube rim width
           if component.rim_width != @rear_tube_selected.rim_width
             @rw_error_rear_tube_rim_width << component
             @incompatible_components << component
           end
      end

    end # end rear wheel loop
    end # end rear wheel if statement
    
     ### REAR TUBE ###
      #set rear tube error arrays
      @rtu_error_rear_wheel_size = [] 
      @rtu_error_rear_wheel_rim_width = [] 
      @rtu_error_rear_wheel_size = [] 
      @rtu_error_rear_tire_width = [] 


      if @components.where(:component_type => 'Rear Tube').each do |component|

        if @rear_wheel_selected
          #rear wheel size
            if component.wheel_size != @rear_wheel_selected.wheel_size
              @rtu_error_rear_wheel_size << component
              @incompatible_components << component
            end
          #rear wheel rim width
             if component.rim_width != @rear_wheel_selected.rim_width
               @rtu_error_rear_wheel_rim_width << component
               @incompatible_components << component
             end
        end
        
        if @rear_tire_selected
          #rear tire wheel size & rear tube tire size
            if component.tire_size != @rear_tire_selected.tire_size
              @rtu_error_rear_wheel_size << component
              @incompatible_components << component
            end
          #rear tire width
             if component.tire_width != @rear_tire_selected.tire_width
               @rtu_error_rear_tire_width << component
               @incompatible_components << component
             end
        end

      end # end rear tube loop
      end # end rear tube if statement
    
    ###REMOVE INCOMPATIBLE FRONT END COMPONENTS FROM COMPONENTS!###
    #remove incompatible components
    @incompatible_components.uniq! 
    if @incompatible_components.empty?
    else
    @components = @components.incompatible(@incompatible_components) 
    end
  end
  
  def finishing
    @nav_id = 'finishing'
    @finishing = 'active_progress'   
    general_filters
  end
  
  def finishing_compatibility_check
    #set variables for arrays
    @incompatible_components = []
    
    ### PEDAL STRAP ###
    #set pedal strap error array
    @stp_error_pedal_strap = []
    
    if @components.where(:component_type => 'Pedal Strap').each do |component|
      
      if @pedal_selected
        #pedal strap
          if component.pedal_strap != @pedal_selected.pedal_strap
            @stp_error_pedal_strap << component
            @incompatible_components << component
          end
      end
    end #end pedal strap
    end #end pedal strap
    
    ### SEAT POST ###
    #set seat post error array
    @sp_error_frame_seat_tube_inner_diameter = []
    @sp_error_saddle_clamp = []
    @sp_error_seat_clamp_seat_tube_inner_diameter = []
    
    
    
    
    if @components.where(:component_type => 'Seat Post').each do |component|
      
      if @frame_model
        #frame seat tube inner diameter
          if component.seat_tube_inner_diameter != @frame_model.seat_tube_inner_diameter
            @sp_error_frame_seat_tube_inner_diameter << component
            @incompatible_components << component
          end
      end
      
      if @saddle_selected
        #saddle clamp error
        if component.clamp != @saddle_selected.clamp
          @sp_error_saddle_clamp << component
          @incompatible_components << component
        end
      end
      
      if @seat_clamp_selected
        #seat clamp seat tube inner diameter
        if component.seat_tube_inner_diameter != @seat_clamp_selected.seat_tube_inner_diameter
          @sp_error_seat_clamp_seat_tube_inner_diameter << component
          @incompatible_components << component
        end
      end
      
    end #end seat post loop
    end #end seat post if statement

    ### SADDLE ###
    #set saddle error array
    @sdl_error_seat_post_attachment_type = []
    
    if @components.where(:component_type => 'Saddle').each do |component|
      
      if @seat_post_selected
        #seat post attachment type
          if component.attachment_type != @seat_post_selected.attachment_type
            @sdl_error_seat_post_attachment_type << component
            @incompatible_components << component
          end
      end
    end #end saddle loop
    end #end saddle if statement

    ### SEAT CLAMP ###
    #set seat clamp error array
    @sc_error_frame_seat_tube_inner_diameter = []
    @sc_error_frame_seat_tube_outer_diameter = []
    @sc_error_seat_post_seat_tube_inner_diameter = []
    
    
    if @components.where(:component_type => 'Seat Clamp').each do |component|
      
      if @frame_model
        #frame seat tube inner diameter
          if component.seat_tube_inner_diameter != @frame_model.seat_tube_inner_diameter
            @sc_error_frame_seat_tube_inner_diameter << component
            @incompatible_components << component
          end
        #frame seat tube outer diameter
          if component.seat_tube_outer_diameter != @frame_model.seat_tube_outer_diameter
            @sc_error_frame_seat_tube_outer_diameter << component
            @incompatible_components << component
          end
      end
      
      if @seat_post_selected 
          if component.seat_tube_inner_diameter != @seat_post_selected.seat_tube_inner_diameter
            @sc_error_seat_post_seat_tube_inner_diameter << component
            @incompatible_components << component
          end
      end
    end #end seat clamp loop
    end #end seat clamp if statement  
    
    ###REMOVE INCOMPATIBLE FINISHING COMPONENTS FROM COMPONENTS!###
    #remove incompatible components
    @incompatible_components.uniq! 
    if @incompatible_components.empty?
    else
    @components = @components.incompatible(@incompatible_components) 
    end
  end
  
  def custom_component_select_or_add
    ### ADD CUSTOM COMPONENT TO BUILD ###
    if params[:custom_component]
      @custom_component = CustomComponent.new(params[:custom_component])
      add_custom_component_to_build
    else #if no custom_component parameter submitted
    
     #### SHOW AND LIST COMPONENTS ####
     if params[:item] == 'custom_component'
      @component_specs = 'true'
      @custom_component = CustomComponent.new
      @new_custom_component = 'true'
      list_components
      if @nav_id == "drivetrain"
      @custom_components = @drivetrain_components
      elsif @nav_id == "front_end"
      @custom_components = @front_end_components
      elsif @nav_id == "wheels"
      @custom_components = @wheel_components
      elsif @nav_id == "finishing"
      @custom_components = @finishing_components  
      end  
      @custom_components_array = @custom_components.map { |component| [component, component] }
     end # end custom component if statement
      
      ### SHOW COMPONENT SPECS AFTER COMPONENT TYPE IS SUBMITTEd ###
      if params[:component_type] 
        @component_specs = 'true'
        @new_custom_component = 'false'
        find_component(params[:component_type])
        @component_type = params[:component_type]
      end
    end #custom component
  end
  
  def select_component
      @component_name = params[:component]
      @id = params[:id]
      add_component_to_build
      reset_compartments
      flash[:notice] = 'Component Added to Build'  
      component = Component.find(params[:id])
      redirect_back
  end
  
  def add_component_to_build
    component = Component.find(params[:id])
    @build.add_component_to_build(component)
    session[:build] = @build
  end
  
  def add_custom_component_to_build
    @build.add_custom_component_to_build(@custom_component)
    @custom_component.save
    session[:build] = @build
    flash[:notice] = 'Custom Component Successfully Added to Build'
  end
  
  def add_package_to_build
    #find_package_components
    #@components.each do |c|
      #@build.add_component_to_build(c)
    #end

    package = ComponentPackage.find(params[:add_package])
    compartment = package.compartment
    check_compartment_completion
    ### Clear out necessary compartments ###
    if compartment == 'drivetrain' && @dt_build_item == 'true'
      params[:reset] = 'drivetrain'
    elsif compartment == 'drivetrain' && @fe_build_item == 'true'
      params[:reset] = 'front_end'
    elsif compartment == 'front_end' && @fe_build_item == 'true'
      params[:reset] = 'front_end'
    elsif compartment == 'front_end' && @w_build_item == 'true'
      params[:reset] = 'wheels'
    elsif compartment == 'wheels' && @w_build_item == 'true'
      params[:reset] = 'wheels'
    elsif compartment == 'wheels' && @f_build_item == 'true'
      params[:reset] = 'finishing'
    elsif compartment == 'finishing' && @f_build_item == 'true'
      params[:reset] = 'finishing'
    end
    reset_compartments
    @build.add_component_package_to_build(package)
    params[:reset] = nil
    session[:build] = @build
    flash[:notice] = 'the package was successfully added to your build'
    redirect_to(:action => compartment)
  end
  
  def remove_component_from_build
    reset_compartments
    list_components
    @component_name = params[:component]
    component = Component.find(params[:id])
    @build.remove_component_from_build(component)
    session[:build] = @build
    flash[:notice] = 'Component Successfully Removed From Build'
    redirect_back
  end
  
  def remove_custom_component_from_build
    reset_compartments
    list_components
    component_type = params[:component_type]
    @build.remove_custom_component_from_build(component_type)
    session[:build] = @build
    flash[:notice] = 'Custom Component Successfully Removed From Build'
    redirect_back
  end
  
  def clear_compartment_from_build
    @items_to_delete = @package_items_to_delete = []
    @compartment_name = params[:compartment]
    @build.items.each do |item|
		if (item.component && (item.component.compartment == @compartment_name))  || (item.custom_component && (item.custom_component.compartment == @compartment_name))
		  @items_to_delete << item
		elsif (item.component_package && (item.component_package.compartment == @compartment_name))
		  @package_items_to_delete << item
		end
	  end
	  if !@items_to_delete.empty?
    @build.remove_compartment_from_build(@items_to_delete)
    elsif !@package_items_to_delete.empty?
    @build.remove_package_from_build(@package_items_to_delete)
    end
    session[:build] = @build
    #clear from component select
    if @result_of_component_select == 'true'
    else
    flash[:notice] = 'Compartment Successfully Removed From Build'
    redirect_back
    end
  end
  
  def list_components
    
    if (@speed == 'multi' && @gear != nil) || (@font_derailleur == 'true' &&  @rear_derailleur == 'true')
    @front_end_components = ['Fork', 'Stem', 'Front Brake', 'Rear Brake', 'Front Shifter', 'Rear Shifter', 'Front Lever', 'Rear Lever', 'Handlebar', 'Headset']
    @drivetrain_components = ['Crank', 'Cog Cassette', 'Bottom Bracket', 'Front Derailleur', 'Rear Derailleur', 'Chainring', 'Chain']
    elsif @speed == 'single'
      @front_end_components = ['Fork', 'Stem', 'Front Brake', 'Rear Brake', 'Front Lever', 'Rear Lever', 'Handlebar', 'Headset']
      @drivetrain_components = ['Crank', 'Cog Cassette', 'Bottom Bracket', 'Chainring', 'Chain']
    elsif   @front_derailleur == 'true' &&  @rear_derailleur == 'false'
      @front_end_components = ['Fork', 'Stem', 'Front Brake', 'Rear Brake', 'Front Shifter', 'Front Lever', 'Rear Lever', 'Handlebar', 'Headset']
      @drivetrain_components = ['Crank', 'Cog Cassette', 'Bottom Bracket', 'Chainring', 'Chain', 'Front Derailleur',]
    elsif   @front_derailleur == 'false' &&  @rear_derailleur == 'true'
      @front_end_components = ['Fork', 'Stem', 'Front Brake', 'Rear Brake', 'Rear Shifter', 'Front Lever', 'Rear Lever', 'Handlebar', 'Headset']
      @drivetrain_components = ['Crank', 'Cog Cassette', 'Bottom Bracket', 'Chainring', 'Chain', 'Rear Derailleur',]
    end

    @wheel_components = ['Front Wheel', 'Rear Wheel', 'Front Tube', 'Rear Tube', 'Front Tire', 'Rear Tire']
    @finishing_components = ['Seat Post', 'Saddle', 'Seat Clamp', 'Pedal', 'Pedal Strap', 'Grip', 'Half Link']
  end
  
  def find_package_components
    if params[:package_id]
      @package = ComponentPackage.find(params[:package_id])
    elsif params[:selected_package_id]
      @package =  ComponentPackage.find(params[:selected_package_id])
    end
    
    if @package.package_type == 'drivetrain-single_speed'
        @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.crank_id, @package.cog_id,  @package.bottom_bracket_id, @package.chain_id, @package.chainring_id)
        @drivetrain_package_components = @package_components
    elsif @package.package_type == 'drivetrain-multi_speed'
      @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.rear_derailleur_id, @package.front_derailleur_id, @package.crank_id, @package.cog_id,  @package.bottom_bracket_id, @package.chain_id, @package.chainring_id)
        @drivetrain_package_components = @package_components
    elsif @package.package_type == 'front_end-single_speed'
      @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.front_brake_id, @package.rear_brake_id, @package.fork_id, @package.stem_id, @package.handlebar_id, @package.headset_id, @package.front_lever_id, @package.rear_lever_id)
      @front_end_package_components = @package_components
    elsif @package.package_type == 'front_end-multi_speed'
      @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.front_brake_id, @package.rear_brake_id, @package.fork_id, @package.stem_id,  @package.front_shifter_id, @package.rear_shifter_id, @package.front_lever_id, @package.rear_lever_id, @package.handlebar_id, @package.headset_id)
      @front_end_package_components = @package_components
    elsif @package.package_type == 'wheels'
      @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.front_wheel_id, @package.rear_wheel_id, @package.front_tube_id, @package.rear_tube_id, @package.front_tire_id, @package.rear_tire_id)
      @wheels_package_components = @package_components
    elsif @package.package_type == 'finishing'
      @package_components = Component.where('id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?', @package.saddle_id, @package.seat_post_id, @package.seat_clamp_id, @package.grip_id, @package.pedal_id, @package.pedal_strap_id, @package.half_link_id)
      @finishing_package_components = @package_components
    end
    if params[:package_id]
      @components = @package_components
    elsif params[:selected_package_id]
      @components = @package_components
    end
  end
  
  def reset_build
    @build.empty_all_items
    #session[:customer_build_id] = nil
    flash[:notice] = 'your build has been reset'
    redirect_to(:action => 'frames')
  end
  
  def reset_compartments
    #reset compartents if modifying build
    if params[:reset] == 'drivetrain' 
      @result_of_component_select = 'true'
      params[:compartment] = 'drivetrain'
      clear_compartment_from_build
      params[:compartment] = 'front_end'
      clear_compartment_from_build
      params[:compartment] = 'wheels'
      clear_compartment_from_build
      params[:compartment] = 'finishing'
      clear_compartment_from_build
    elsif params[:reset] == 'front_end'
      @result_of_component_select = 'true'
      params[:compartment] = 'front_end'
      clear_compartment_from_build
      params[:compartment] = 'wheels'
      clear_compartment_from_build
      params[:compartment] = 'finishing'
      clear_compartment_from_build
    elsif params[:reset] == 'wheels'
      @result_of_component_select = 'true'
      params[:compartment] = 'wheels'
      clear_compartment_from_build
      params[:compartment] = 'finishing'
      clear_compartment_from_build
    elsif params[:reset] == 'finishing'
      @result_of_component_select = 'true'
      params[:compartment] = 'finishing'
      clear_compartment_from_build
    end
  end
  
  def drop_in
    @build.empty_all_items
    @frame_model = session[:frame_model]
    session[:build_frame] = session[:frame_model]
    frame = session[:frame_model]
    frame_size = session[:frame_mode]
    gear = session[:gear]
    frame_size = session[:frame_model_size]
    top_tube_style = session[:top_tube_style]
    @build.add_frame_to_build(frame, frame_size, gear, top_tube_style, 'true')
    session[:build] = @build
    session[:frame_model] = nil
    session[:frame_mode] = nil
    session[:gear] = nil
    session[:frame_model_size] = nil
    session[:top_tube_style] = nil
    redirect_to :action => 'drivetrain'
  end

  def check_compartment_completion
    @build_component = 'false'
    #DRIVETRAIN CHECK
    @drivetrain_complete = 'false'
    @dt_build_item = 'false'
    assign_selected_components
    @build.items.each do |item|  
      if item.component
        @component_check = item.component
        assign_selected_components
      elsif item.custom_component
        @component_check = item.custom_component
        assign_selected_components
      elsif item.component_package
        @package = ComponentPackage.find(item.component_package.id)
        find_package_components
        if @drivetrain_package_components
           @drivetrain_package_components.each do |component|
        @component_check = component
        assign_selected_components
        end
        end
        if @front_end_package_components
           @front_end_package_components.each do |component|
        @component_check = component
        assign_selected_components
        end
        end
        if @wheels_package_components
           @wheels_package_components.each do |component|
        @component_check = component
        assign_selected_components
        end
        end
        if @finishing_package_components
           @finishing_package_components.each do |component|
        @component_check = component
        assign_selected_components
        end
        end
      end
    end

    if ((@crank_selected) && (@cog_selected) && (@bottom_bracket_selected) && (@chainring_selected) && (@chain_selected))
      if @speed == 'single'
        @drivetrain_complete = 'true'
      elsif (@rear_derailleur_selected) && (@front_derailleur_selected)
        @drivetrain_complete = 'true'
      end
    end
    if (@fork_selected) && (@stem_selected) && (@front_brake_selected) && (@rear_brake_selected) && (@front_lever_selected) && (@rear_lever_selected) && (@handlebar_selected) && (@headset_selected)
      if @speed == 'single'
        @front_end_complete = 'true'
      elsif (@rear_shifter_selected) && (@front_shifter_selected)
        @front_end_complete = 'true'
      end
    end
    if ((@front_wheel_selected) && (@rear_wheel_selected) && (@front_tire_selected) && (@rear_tire_selected) && (@front_tube_selected) && (@rear_tube_selected))
      @wheels_complete = 'true'
    end
    if ((@saddle_selected) && (@seat_post_selected) && (@seat_clamp_selected) && (@pedal_selected) && (@pedal_strap_selected) && (@grip_selected))
      @finishing_complete = 'true'
    end

    if (@dt_build_item == 'true') || (@fe_build_item == 'true') || (@w_build_item =='true') || (@f_build_item == 'true')
      @build_component = 'true'
    end
    
  end
  
  def assign_selected_components
    if @component_check && (@component_check.component_type == 'Crank')
       @dt_build_item = 'true'
       @crank_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Cog Cassette')
       @dt_build_item = 'true'
       @cog_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Bottom Bracket')
       @dt_build_item = 'true'
       @bottom_bracket_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Chainring')
      @dt_build_item = 'true'
      @chainring_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Chain')
      @dt_build_item = 'true'
      @chain_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Front Derailleur')
      @dt_build_item = 'true'
      @front_derailleur_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Rear Derailleur')
      @dt_build_item = 'true'
      @rear_derailleur_selected = Component.find_by_id(@component_check.id)
    ##FRONT END 
    elsif @component_check && (@component_check.component_type == 'Fork')
       @fe_build_item = 'true'
       @fork_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Stem')
       @fe_build_item = 'true'
       @stem_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Front Brake')
       @fe_build_item = 'true'
       @front_brake_selected = Component.find_by_id(@component_check.id) 
    elsif @component_check && (@component_check.component_type == 'Rear Brake')
      @fe_build_item = 'true'
      @rear_brake_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Front Lever')
      @fe_build_item = 'true'
      @front_lever_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Rear Lever')
      @fe_build_item = 'true'
      @rear_lever_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Front Shifter')
      @fe_build_item = 'true'
      @front_shifter_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Rear Shifter')
      @fe_build_item = 'true'
      @rear_shifter_selected = Component.find_by_id(@component_check.id)
    elsif @component_check && (@component_check.component_type == 'Handlebar')
      @fe_build_item = 'true'
      @handlebar_selected = Component.find_by_id(@component_check.id) 
    elsif @component_check && (@component_check.component_type == 'Headset')
      @fe_build_item = 'true'
      @headset_selected = Component.find_by_id(@component_check.id)
    ### Wheels ###
    elsif @component_check && (@component_check.component_type == 'Front Wheel')
       @front_wheel_selected = Component.find_by_id(@component_check.id)
       @w_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Rear Wheel')
       @rear_wheel_selected = Component.find_by_id(@component_check.id)
       @w_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Front Tire')
       @front_tire_selected = Component.find_by_id(@component_check.id)
       @w_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Rear Tire')
      @rear_tire_selected = Component.find_by_id(@component_check.id)
      @w_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Front Tube')
      @front_tube_selected = Component.find_by_id(@component_check.id)
      @w_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Rear Tube')
      @rear_tube_selected = Component.find_by_id(@component_check.id)
      @w_build_item = 'true'
    ### Finishing ###
    elsif @component_check && (@component_check.component_type == 'Saddle')
       @saddle_selected = Component.find_by_id(@component_check.id)
       @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Seat Post')
      @seat_post_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Seat Clamp')
      @seat_clamp_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Pedal')
      @pedal_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Pedal Strap')
      @pedal_strap_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Grip')
      @grip_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    elsif @component_check && (@component_check.component_type == 'Half Link')
      @half_link_selected = Component.find_by_id(@component_check.id)
      @f_build_item = 'true'
    end
  end
  
  def component_sort
      if params[:sort]
        sort = case params['sort']
               when "name"  then "name ASC"
               when "qty"   then "quantity ASC"
               when "price" then "price ASC"
               when "type" then "component_type ASC"  
               when "name_reverse"  then "name DESC"
               when "qty_reverse"   then "quantity DESC"
               when "price_reverse" then "price DESC"
               end
        else 
          sort = session[:sort] ||= "name ASC"
        end
        session[:sort] = sort
       query = params[:search][:query] if params[:search]
            
       conditions = ["LOWER(name) LIKE ?", "%#{query.downcase}%"] unless query.nil?

       @components = @components.where(conditions).order(sort).paginate(:per_page => @per_page, :page => params[:page])
        respond_to do |format|
          format.html { render 'bike_builder'}
          format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity } 
          if params[:reset]
            flash[:notice] = 'Compartment successfully cleared.'
            format.js {render 'clear.js'}  
          else
            format.js {render 'sort.js'}  
          end
        end
  end
  
  def save_build
    @build = session[:build]
     if session[:customer_build_id]
       @customer_build = CustomerBuild.find(session[:customer_build_id])
       @build_items = CustomerBuildItem.find_all_by_customer_build_id(@customer_build.id)
       @build_items.each{ |u| u.destroy }
     else
      @customer_build = CustomerBuild.new
    end
    session[:build_frame].save
     @customer_build.customer_build_items << @build.items
     @customer_build.update_attributes(:customer_id => session[:customer_id], :price => @build.total_price)
     @customer_build.save
    flash[:notice] = 'your build has been saved'
    session[:customer_build_id] = @customer_build.id
    redirect_back
  end
  
  def resume_build
    @build = Build.new
    @build_items = CustomerBuildItem.find_all_by_customer_build_id(params[:build_id])
    @build_items.each do |item|
      if item.frame_model_id
        frame = FrameModel.find(item.frame_model_id)
        frame_size = FrameModelSize.find(item.frame_model_size_id)
        gear = Gear.find(item.gear_id)
        top_tube_style = TopTubeStyle.find(item.top_tube_style_id)
        price = item.price
        if item.price == 0
          drop_in = 'true'
        else
          drop_in = 'false'
        end
        @build.add_frame_to_build(frame, frame_size, gear, top_tube_style, drop_in)
      elsif item.component_id
        component = Component.find(item.component_id)
        @build.add_component_to_build(component)
      elsif item.custom_component_id
        custom_component = CustomComponent.find(item.custom_component_id)
        @build.add_custom_component_to_build(custom_component)
      elsif item.custom_frame_model_id
        custom_frame = CustomFrameModel.find(item.custom_frame_model_id)
        @build.add_custom_frame_to_build(custom_frame)
      elsif item.component_package_id
        component_package = ComponentPackage.find(item.component_package_id)
        @build.add_component_package_to_build(component_package)
      end
      
    end
    @customer_build = CustomerBuild.find(params[:build_id])
    session[:customer_build_id] = params[:build_id]
    session[:build] = @build
    flash[:notice] = 'your build has been resumed'
    redirect_to_current_compartment
  end
  
  def redirect_to_current_compartment
    frame_check
    check_compartment_completion
    if @finishing_complete
      redirect_to(:action => 'finishing')
    elsif @wheels_complete == 'true'
      redirect_to(:action => 'finishing')
    elsif @front_end_complete == 'true'
      redirect_to(:action => 'wheels')
    elsif @drivetrain_complete == 'true'
      redirect_to(:action => 'front_end')
    elsif @frame == 'true'
      redirect_to(:action => 'drivetrain')
    elsif session[:customer_build_id] = nil
      redirect_to(:controller => 'bike_builder')
    else
      redirect_to(:action => 'frames')
    end
  end

  def new_build
    session[:customer_build_id] = nil
    @build = Build.new
    session[:build] = @build
    flash[:notice] = 'you now have a new build'
    redirect_to(:action => 'frames')
  end
  
  def delete_build  
    @customer_build = CustomerBuild.find(params[:build_id])
    if @customer_build.id == session[:customer_build_id]
      session[:customer_build_id] = nil
    end
    @build_items = CustomerBuildItem.find_all_by_customer_build_id(@customer_build.id)
    @build_items.each{ |u| u.destroy }
    @customer_build.destroy
    flash[:notice] = 'build deleted'
    session[:customer_build_id] = @customer_build.id
    redirect_back
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
      @compartment = 'finishing'
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
  
  def components_per_page
    #set components per page session
    if params[:per_page]
      @per_page = params[:per_page]
    elsif (session[:per_page] == nil) && (params[:per_page] == nil)
      @per_page = 10
    else
      @per_page = session[:per_page]
    end
    session[:per_page] = @per_page
  end
  
  def clear_search
    session[:query] = nil
  end
  
  def redirect_back
    redirect_to :back
    rescue ActionController::RedirectBackError
    render :partial => 'shared/referrer_error'
  end

  def login
    respond_to do |format|
      format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      format.js {render 'login.js'}  
    end
  end

private

  def find_or_create_build
    @build = session[:build] ||= Build.new
    @page_id = 'bike_builder'
    @cart = session[:cart] ||= Cart.new
     @workshop_cart = session[:workshop_cart] ||= Cart.new
  end

  def find_frame
     @frame_model = session[:build_frame]
  end
  
  def compatibility_check
     @compatibility_check = session[:compatibility] ||= 'on'
     if params[:compatibility]
       @compatibility = params[:compatibility]
       session[:compatibility] = @compatibility
     end
     @component_view = session[:component_view] ||= 'grid'
      if params[:component_view]
        @component_view = params[:component_view]
        session[:component_view] = @component_view
      end
  end

 
end