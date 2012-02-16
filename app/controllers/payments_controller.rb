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
    if @cart != []
    @work_count = 0
    @comp_count = 0
    @cart = session[:cart]
    @order = Order.new
    @customer = Customer.find(session[:customer_id])
    @cart = session[:cart]
    @order.line_items << @cart.items
    @customer.orders << @order
    decrement_items
    @order.update_attributes(:invoice_number => @order.id, :status => "processing", :shipping_id => session[:shipping_id])
    client_ids = @order.line_items.map(&:client_id).flatten.uniq
    client_ids.each do |id|
      client = User.find_by_client_id(id)
      #ClientOrder.client_order_email(@order, client).deliver
    end
    #CustomerOrder.customer_order_email(@order).deliver
    @cart.empty_all_items
    session[:shipping_id] = nil
    @backoverride = "true"
  end
  end
    
  def decrement_items
    for item in @order.line_items
      if item.workshop
        @workshop = Workshop.find(item.workshop.id)
        @workshop.update_attributes(:quantity => (@workshop.quantity -= item.quantity))
      end
      if item.accessory
        if item.option
          @option = Option.find(item.option.id)
          if @option.quantity 
          @option.update_attributes(:quantity => (@option.quantity -= item.quantity))
          end
        end
      end
        
    end
  end

  protected

  def calculate_amount
    # in a real app this be calculated from a shopping cart, determined by the product, etc.
    
  end

end



