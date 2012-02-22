class Accessory < ActiveRecord::Base
  has_many :line_items
  has_many :options
  has_many :photos
  attr_accessor :option_selection
  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :options, :allow_destroy => true
   before_save :destroy_photo?
    
      def photo_delete
        @photo_delete ||= "0"
      end

      def photo_delete=(value)
        @photo_delete = value
      end
  before_save :destroy_option?

      def option_delete
        @option_delete ||= "0"
      end

      def option_delete=(value)
        @option_delete = value
      end
    private
      def destroy_photo?
        @accessory.photo.destroy if @photo_delete == "1"
      end
       def destroy_option?
          @accessory.option.destroy if @option_delete == "1"
        end

  
end
