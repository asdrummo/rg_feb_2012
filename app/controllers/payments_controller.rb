class PaymentsController < ApplicationController
  layout 'standard'
  def new
    @amount = params[:amount]
     
  end

  def confirm
    @work_count = 0
    @comp_count = 0
    @cart = session[:cart]
    @order = Order.new
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
      @customer = Customer.find(session[:customer_id])
      @order = Order.new
      @cart = session[:cart]
      @order.line_items << @cart.items
      decrement_reservation
      @order.update_attributes(:invoice_number => @result.transaction.id, :status => "pending")
      @customer.orders << @order
      @cart.empty_all_items
      render :action => "confirm"
    else
      redirect_to(:controller => "public", :action => "payment_fail")
    end
  end
  
  def show_receipt
    @work_count = 0
    @comp_count = 0
    @cart = session[:cart]
    @order = Order.new
    @customer = Customer.find(session[:customer_id])
    @cart = session[:cart]
    @order.line_items << @cart.items
    @customer.orders << @order
    decrement_reservation
    @order.update_attributes(:invoice_number => @order.id, :status => "pending")
    @cart.empty_all_items
  end
    
  def decrement_reservation
    for item in @order.line_items
      if item.workshop
        @workshop = Workshop.find(item.workshop.id)
        @workshop.update_attributes(:quantity => (@workshop.quantity -= 1))
      end
    end
  end

  protected

  def calculate_amount
    # in a real app this be calculated from a shopping cart, determined by the product, etc.
    
  end

end



