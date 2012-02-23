# initializers/s3.rb
if Rails.env == "production"
  # set credentials from ENV hash
  S3_CREDENTIALS = { :access_key_id => ENV['AKIAIBJOJM67DSVXXSAA'], :secret_access_key => ENV['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'], :bucket => "roamandgauge"}
else
  # get credentials from YML file
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end



