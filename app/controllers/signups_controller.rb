class SignupsController < ApplicationController
  layout 'signup'
  # GET /signups
  # GET /signups.xml
  
  def signup
    @signup = Signup.new
    @page_title = 'Sign Up'
    if params[:signup]
       @signup = Signup.new(params[:signup])
          if @signup.save
            @submitted = 'true'
          end
    end
    render 'signup'

  end
  
  def index
    @signups = Signup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @signups }
    end
  end

  # GET /signups/1
  # GET /signups/1.xml
  def show
    @signup = Signup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @signup }
    end
  end

  # GET /signups/new
  # GET /signups/new.xml
  def new
    @page_title = "new"
    @signup = Signup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @signup }
    end
  end

  # GET /signups/1/edit
  def edit
    @signup = Signup.find(params[:id])
  end

  # POST /signups
  # POST /signups.xml
  def create
    @signup = Signup.new(params[:signup])
      if @signup.save
        @submitted = 'true'
        redirect_to 'signup'
      
      else
        respond_to do |format|
        format.html { render 'signup' }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
        format.js 
      end
      end
    
  end

  # PUT /signups/1
  # PUT /signups/1.xml
  def update
    @signup = Signup.find(params[:id])

    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        format.html { redirect_to(@signup, :notice => 'Signup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.xml
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to(signups_url) }
      format.xml  { head :ok }
    end
  end
end
