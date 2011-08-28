class Photo < ActiveRecord::Base
  belongs_to :bottom_bracket

  has_attached_file :data, :styles => {:thumb=> "100x100#",
  :small  => "150x150>" },
                       :path => ":rails_root/public/images/components/:id/:style/:filename",
                       :url => "/images/components/:id/:style/:filename"

end




