class Components::SeatPostsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
  # GET /components/seat_posts
  # GET /components/seat_posts.xml
  def index
    @components_seat_posts = Components::SeatPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_seat_posts }
    end
  end

  # GET /components/seat_posts/1
  # GET /components/seat_posts/1.xml
  def show
    @components_seat_post = Components::SeatPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_seat_post }
    end
  end

  # GET /components/seat_posts/new
  # GET /components/seat_posts/new.xml
  def new
    @components_seat_post = Components::SeatPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_seat_post }
    end
  end

  # GET /components/seat_posts/1/edit
  def edit
    @components_seat_post = Components::SeatPost.find(params[:id])
  end

  # POST /components/seat_posts
  # POST /components/seat_posts.xml
  def create
    @components_seat_post = Components::SeatPost.new(params[:components_seat_post])

    respond_to do |format|
      if @components_seat_post.save
        format.html { redirect_to(@components_seat_post, :notice => 'Seat post was successfully created.') }
        format.xml  { render :xml => @components_seat_post, :status => :created, :location => @components_seat_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_seat_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/seat_posts/1
  # PUT /components/seat_posts/1.xml
  def update
    @components_seat_post = Components::SeatPost.find(params[:id])

    respond_to do |format|
      if @components_seat_post.update_attributes(params[:components_seat_post])
        format.html { redirect_to(@components_seat_post, :notice => 'Seat post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_seat_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/seat_posts/1
  # DELETE /components/seat_posts/1.xml
  def destroy
    @components_seat_post = Components::SeatPost.find(params[:id])
    @components_seat_post.destroy

    respond_to do |format|
      format.html { redirect_to(components_seat_posts_url) }
      format.xml  { head :ok }
    end
  end
end
