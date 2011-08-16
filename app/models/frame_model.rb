class FrameModel < ActiveRecord::Base
  has_many :line_items
  has_one :frame_model_size
end
