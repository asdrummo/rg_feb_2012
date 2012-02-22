class CustomerMailer < ActionMailer::Base
    default :from => "andrew@roamandgauge.com"

    def registration_confirmation(customer)
      @customer = customer
      attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
      mail(:to => "#{customer.first_name} <#{customer.email}>", :subject => "Registered")
    end
  end

