class Components::BottomBracketsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/bottom_brackets
  # GET /components/bottom_brackets.xml
  def index
    @components_bottom_brackets = Components::BottomBracket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_bottom_brackets }
    end
  end

  # GET /components/bottom_brackets/1
  # GET /components/bottom_brackets/1.xml
  def show
    @components_bottom_bracket = Components::BottomBracket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_bottom_bracket }
    end
  end

  # GET /components/bottom_brackets/new
  # GET /components/bottom_brackets/new.xml
  def new
    @components_bottom_bracket = Components::BottomBracket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_bottom_bracket }
    end
  end

  # GET /components/bottom_brackets/1/edit
  def edit
    @components_bottom_bracket = Components::BottomBracket.find(params[:id])
  end

  # POST /components/bottom_brackets
  # POST /components/bottom_brackets.xml
  def create
    @components_bottom_bracket = Components::BottomBracket.new(params[:components_bottom_bracket])

    respond_to do |format|
      if @components_bottom_bracket.save
        format.html { redirect_to(@components_bottom_bracket, :notice => 'Bottom bracket was successfully created.') }
        format.xml  { render :xml => @components_bottom_bracket, :status => :created, :location => @components_bottom_bracket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_bottom_bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/bottom_brackets/1
  # PUT /components/bottom_brackets/1.xml
  def update
    @components_bottom_bracket = Components::BottomBracket.find(params[:id])

    respond_to do |format|
      if @components_bottom_bracket.update_attributes(params[:components_bottom_bracket])
        format.html { redirect_to(@components_bottom_bracket, :notice => 'Bottom bracket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_bottom_bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/bottom_brackets/1
  # DELETE /components/bottom_brackets/1.xml
  def destroy
    @components_bottom_bracket = Components::BottomBracket.find(params[:id])
    @components_bottom_bracket.destroy

    respond_to do |format|
      format.html { redirect_to(components_bottom_brackets_url) }
      format.xml  { head :ok }
    end
  end
end
