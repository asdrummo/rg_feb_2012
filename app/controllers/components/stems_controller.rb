class Components::StemsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/stems
  # GET /components/stems.xml
  def index
    @components_stems = Components::Stem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_stems }
    end
  end

  # GET /components/stems/1
  # GET /components/stems/1.xml
  def show
    @components_stem = Components::Stem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_stem }
    end
  end

  # GET /components/stems/new
  # GET /components/stems/new.xml
  def new
    @components_stem = Components::Stem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_stem }
    end
  end

  # GET /components/stems/1/edit
  def edit
    @components_stem = Components::Stem.find(params[:id])
  end

  # POST /components/stems
  # POST /components/stems.xml
  def create
    @components_stem = Components::Stem.new(params[:components_stem])

    respond_to do |format|
      if @components_stem.save
        format.html { redirect_to(@components_stem, :notice => 'Stem was successfully created.') }
        format.xml  { render :xml => @components_stem, :status => :created, :location => @components_stem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_stem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/stems/1
  # PUT /components/stems/1.xml
  def update
    @components_stem = Components::Stem.find(params[:id])

    respond_to do |format|
      if @components_stem.update_attributes(params[:components_stem])
        format.html { redirect_to(@components_stem, :notice => 'Stem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_stem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/stems/1
  # DELETE /components/stems/1.xml
  def destroy
    @components_stem = Components::Stem.find(params[:id])
    @components_stem.destroy

    respond_to do |format|
      format.html { redirect_to(components_stems_url) }
      format.xml  { head :ok }
    end
  end
end
