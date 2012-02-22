class ClientOrder < ActionMailer::Base
  default :from => "orders@roamandgauge.com"
  
  def client_order_email(order, client)
      @order = order
      @customer = Customer.find(@order.customer_id)
      @client = client
      mail(:to => "#{client.first_name} <#{client.email}>", :subject => ("Order #" + @order.invoice_number.to_s))
  end
  

end
