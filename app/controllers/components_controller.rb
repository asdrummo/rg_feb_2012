class ComponentsController < ApplicationController
  before_filter :confirm_logged_in, :except => :submit_component
  layout 'admin'
  
  def submit_component
      @comonent = params[:component]
      @id = params[:id]
      if @component = 'Bottom Bracket'
        add_bottom_bracket_to_cart
      elsif @component = 'front_brake'
        add_front_brake_to_cart
      end
      flash[:notice] = 'Item Added to Cart'
      redirect_to(:back)
  end
  
  def add_bottom_bracket_to_cart
    component = Components::BottomBracket.find(@id)
    name = "bottom_bracket"
    @cart.add_component(component, name)
    session[:cart] = @cart
  end
  
  
end