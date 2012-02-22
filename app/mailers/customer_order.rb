class CustomerOrder < ActionMailer::Base
  default :from => "orders@roamandgauge.com"
  def customer_order_email(order)
      @order = order
      @customer = Customer.find(@order.customer_id)
      mail(:to => "#{@customer.first_name} <#{@customer.email}>", :subject => ("Order #" + @order.invoice_number.to_s))
  end
end
