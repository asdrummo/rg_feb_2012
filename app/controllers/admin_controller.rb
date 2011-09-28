class AdminController < ApplicationController

  before_filter :confirm_logged_in, :only => [:index, :menu]
   before_filter :find_user, :only => [:orders, :components, :menu]
  layout 'admin'
 
  def menu
    render('menu')
  end
  
  def orders
     if params[:status]
         @line_item = LineItem.find(params[:id])
         @line_item.update_attributes(:status => params[:status])
     end
     if params[:line_item]
       @line_item = LineItem.find(params[:id])
        @line_item.update_attributes(params[:line_item])
      end
       
    @orders = Order.order("created_at DESC")
  end
  
  def login
    @user = User.new
  end
  
  def attempt_login
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      #flash[:notice] = "You are now logged in"
      redirect_to(:action =>'menu')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end
  
  def components
  end
  def error_forbidden
    render('403')
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You are now logged out."
    redirect_to(:action => 'login')
  end
    
    private 

  def find_user
    @user = User.find(session[:user_id])
  end
end
