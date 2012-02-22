class Component < ActiveRecord::Base
  has_many :line_items
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  before_save :destroy_photo?
  scope :incompatible, lambda { |components| where(["id not in (?)", components.map(&:id)]) }
  validates :price, :presence => true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  
    
      def photo_delete
        @photo_delete ||= "0"
      end

      def photo_delete=(value)
        @photo_delete = value
      end

    private
      def destroy_photo?
        @component.photo.destroy if @photo_delete == "1"
      end

  
end
