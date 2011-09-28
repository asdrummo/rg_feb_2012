class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'admin', :action => 'login')
      return false #halts the before_filter
    else
      return true
    end
  end
  

    private

  
  def render_forbidden
    respond_to do |format|
      format.html { render :action => "errors/forbidden", :status => 403 }
      
    end
    true
 end 
  
end
