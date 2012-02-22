ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "roamandgauge.com",
  :user_name            => "asdrummo",
  :password             => "1fgu.crew",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
require 'development_mail_interceptor'
ActionMailer::Base.default_url_options[:host] = "localhost:5000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?