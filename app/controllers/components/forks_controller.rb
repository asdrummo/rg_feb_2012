class Components::ForksController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/forks
  # GET /components/forks.xml
  def index
    @components_forks = Components::Fork.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_forks }
    end
  end

  # GET /components/forks/1
  # GET /components/forks/1.xml
  def show
    @components_fork = Components::Fork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_fork }
    end
  end

  # GET /components/forks/new
  # GET /components/forks/new.xml
  def new
    @components_fork = Components::Fork.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_fork }
    end
  end

  # GET /components/forks/1/edit
  def edit
    @components_fork = Components::Fork.find(params[:id])
  end

  # POST /components/forks
  # POST /components/forks.xml
  def create
    @components_fork = Components::Fork.new(params[:components_fork])

    respond_to do |format|
      if @components_fork.save
        format.html { redirect_to(@components_fork, :notice => 'Fork was successfully created.') }
        format.xml  { render :xml => @components_fork, :status => :created, :location => @components_fork }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_fork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/forks/1
  # PUT /components/forks/1.xml
  def update
    @components_fork = Components::Fork.find(params[:id])

    respond_to do |format|
      if @components_fork.update_attributes(params[:components_fork])
        format.html { redirect_to(@components_fork, :notice => 'Fork was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_fork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/forks/1
  # DELETE /components/forks/1.xml
  def destroy
    @components_fork = Components::Fork.find(params[:id])
    @components_fork.destroy

    respond_to do |format|
      format.html { redirect_to(components_forks_url) }
      format.xml  { head :ok }
    end
  end
end
