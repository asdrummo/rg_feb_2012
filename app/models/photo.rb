class Photo < ActiveRecord::Base
  belongs_to :component

  has_attached_file :data, :styles => {:thumb=> "100x100#",
  :small  => "500x500>", :large => "1000x1000" },
                       :path => ":rails_root/public/images/product_uploads/:id/:style/:filename",
                       :url => "/images/product_uploads/:id/:style/:filename"

end




