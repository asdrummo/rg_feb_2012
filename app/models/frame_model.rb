class FrameModel < ActiveRecord::Base
  has_many :line_items
  has_one :frame_model_size
  serialize :gears
  attr_accessor :size_selection, :top_tube_selection, :gear_selection
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
        @frame_model.photo.destroy if @photo_delete == "1"
      end

  
end
