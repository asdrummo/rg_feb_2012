class AccessoriesController < ApplicationController
  before_filter :find_user
  layout 'standard'
  
  # GET /accessories
  # GET /accessories.xml
  def index
    @accessories = Accessory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accessories }
    end
  end

  # GET /accessories/1
  # GET /accessories/1.xml
  def show
    @accessory = Accessory.find(params[:id])
    @option = Option.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accessory }
    end
  end

  # GET /accessories/new
  # GET /accessories/new.xml
  def new
    @accessory = Accessory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accessory }
    end
  end

  # GET /accessories/1/edit
  def edit
    @accessory = Accessory.find(params[:id])
    @option = Option.new
    
  end

  # POST /accessories
  # POST /accessories.xml
  def create
    @accessory = Accessory.new(params[:accessory])

    respond_to do |format|
      if @accessory.save
        if @accessory.image_path.blank?
             @accessory.update_attributes(:image_path => ("accessories/default.png"))
         end
        format.html { redirect_to(@accessory, :notice => 'Accessory was successfully created.') }
        format.xml  { render :xml => @accessory, :status => :created, :location => @accessory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accessory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accessories/1
  # PUT /accessories/1.xml
  def update
    @accessory = Accessory.find(params[:id])

    respond_to do |format|
      if @accessory.update_attributes(params[:accessory])
        if @accessory.image_path.blank?
             @accessory.update_attributes(:image_path => ("accessories/default.png"))
         end
        format.html { redirect_to(@accessory, :notice => 'Accessory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accessory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.xml
  def destroy
    @accessory = Accessory.find(params[:id])
    @accessory.destroy
    if options = Option.find_all_by_accessory_id(params[:id])
      options.each do |option|
        option.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to(accessories_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete_photo
    @accessory = Accessory.find(params[:id])     
    photo = Photo.find(params[:photo])
    deleted_photo_path = ("product_uploads/" + photo.id.to_s + "/original/"+ photo.data_file_name)
    if @accessory.image_path.to_s == deleted_photo_path.to_s
        @accessory.update_attributes(:image_path => "accessory/default.png")
    end
     if photo.destroy #Will queue the attachment to be deleted
       flash[:notice] = "photo deleted"
       redirect_to :back
      else 

          flash[:notice] = "nothing happened"
            redirect_to :back
        end
  end
  
  def delete_option  
    @option = Option.find(params[:option])
    @accessory = Accessory.find(params[:id]) 
     if @option.destroy #Will queue the attachment to be deleted
       flash[:notice] = "option deleted"
       redirect_to :back
      else 

          flash[:notice] = "nothing happened"
            redirect_to :back
        end
  end
  
  def edit_option
    @accessory = Accessory.find(params[:id])
    @option = Option.find(params[:option_id])
    @option.update_attributes(params[:option])
    redirect_to :back
  end
  
  
    private 

  def find_user
    @user = User.find(session[:user_id])
  end
end
