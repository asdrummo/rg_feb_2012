class Components::ChainsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/chains
  # GET /components/chains.xml
  def index
    @components_chains = Components::Chain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_chains }
    end
  end

  # GET /components/chains/1
  # GET /components/chains/1.xml
  def show
    @components_chain = Components::Chain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_chain }
    end
  end

  # GET /components/chains/new
  # GET /components/chains/new.xml
  def new
    @components_chain = Components::Chain.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_chain }
    end
  end

  # GET /components/chains/1/edit
  def edit
    @components_chain = Components::Chain.find(params[:id])
  end

  # POST /components/chains
  # POST /components/chains.xml
  def create
    @components_chain = Components::Chain.new(params[:components_chain])

    respond_to do |format|
      if @components_chain.save
        format.html { redirect_to(@components_chain, :notice => 'Chain was successfully created.') }
        format.xml  { render :xml => @components_chain, :status => :created, :location => @components_chain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_chain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/chains/1
  # PUT /components/chains/1.xml
  def update
    @components_chain = Components::Chain.find(params[:id])

    respond_to do |format|
      if @components_chain.update_attributes(params[:components_chain])
        format.html { redirect_to(@components_chain, :notice => 'Chain was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_chain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/chains/1
  # DELETE /components/chains/1.xml
  def destroy
    @components_chain = Components::Chain.find(params[:id])
    @components_chain.destroy

    respond_to do |format|
      format.html { redirect_to(components_chains_url) }
      format.xml  { head :ok }
    end
  end
end
