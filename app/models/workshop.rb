class Workshop < ActiveRecord::Base
  has_many :line_items
  validates_presence_of :client_id
  validates_presence_of :experience
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
   before_save :destroy_photo?
    
      def photo_delete
        @photo_delete ||= "0"
      end

      def photo_delete=(value)
        @photo_delete = value
      end

    private
      def destroy_photo?
        @workshop.photo.destroy if @photo_delete == "1"
      end

  
end
