class FrameModelsController < ApplicationController
  before_filter :confirm_logged_in
  before_filter :find_user
  layout 'admin'
  # GET /frame_models
  # GET /frame_models.xml
  def index
    @frame_models = FrameModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frame_models }
    end
  end

  # GET /frame_models/1
  # GET /frame_models/1.xml
  def show
    @frame_model = FrameModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frame_model }
    end
  end

  # GET /frame_models/new
  # GET /frame_models/new.xml
  def new
    @frame_model = FrameModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frame_model }
    end
  end

  # GET /frame_models/1/edit
  def edit
    @frame_model = FrameModel.find(params[:id])
  end

  # POST /frame_models
  # POST /frame_models.xml
  def create
    @frame_model = FrameModel.new(params[:frame_model])

    respond_to do |format|
      if @frame_model.save
        format.html { redirect_to(@frame_model, :notice => 'Frame model was successfully created.') }
        format.xml  { render :xml => @frame_model, :status => :created, :location => @frame_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frame_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frame_models/1
  # PUT /frame_models/1.xml
  def update
    @frame_model = FrameModel.find(params[:id])
    if params[:gears]
    gears = params[:gears].join
    end
    respond_to do |format|
      if @frame_model.update_attributes(params[:frame_model])
        if params[:gears]
          array = []
          params[:gears].each do |x|
          array << x
          end
          gears = array.join("x")
          @frame_model.update_attributes(:gears => gears)
        end
        if params[:sizes]
            array = []
            params[:sizes].each do |x|
            array << x
            end
            sizes = array.join("x")
            @frame_model.update_attributes(:sizes => sizes)
        end
        
        format.html { redirect_to(@frame_model, :notice => 'Frame model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frame_model.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # DELETE /frame_models/1
  # DELETE /frame_models/1.xml
  def destroy
    @frame_model = FrameModel.find(params[:id])
    @frame_model.destroy

    respond_to do |format|
      format.html { redirect_to(frame_models_url) }
      format.xml  { head :ok }
    end
  end
  
    private 

  def find_user
    @user = User.find(session[:user_id])
  end
end
