 PDFKit.configure do |config|       
     config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf').to_s if RAILS_ENV == 'production'   
end