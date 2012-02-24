class Photo < ActiveRecord::Base
  belongs_to :component
  
  #has_attached_file :photo, :storage => :s3, :s3_credentials => S3_CREDENTIALS
  has_attached_file :data, :storage => :s3, :s3_credentials => S3_CREDENTIALS, 
    :styles => {:thumb=> "100x100#", :small  => "500x500>", :large => "1000x1000" },
    :url => "/images/components/:id/:style/:filename",
    :path => "/images/components/:id/:style/:filename"

  #process_in_background :data

  #has_attached_file :data, :styles => {:thumb=> "100x100#",
  #:small  => "500x500>", :large => "1000x1000" },
   #                    :path => ":rails_root/public/images/product_uploads/:id/:style/:filename",
   #                    :url => "/images/product_uploads/:id/:style/:filename"
   # define our paperclip attachment
  

     # cancel post-processing now, and set flag...
     before_data_post_process do |photo|
       if photo.source_changed?
         photo.processing = true
         false # halts processing
       end
     end

     # ...and perform after save in background
     after_save do |photo| 
       if photo.source_changed?
         Delayed::Job.enqueue PhotoJob.new(photo.id)
       end
     end

     # generate styles (downloads original first)
     def regenerate_styles!
       self.data.reprocess! 
       self.processing = false   
       self.save(false)
     end

     # detect if our source file has changed
     def source_changed?
       self.data_file_size_changed? ||
       self.data_file_name_changed? ||
       self.data_content_type_changed? ||
       self.data_update_at_changed?
     end

end




