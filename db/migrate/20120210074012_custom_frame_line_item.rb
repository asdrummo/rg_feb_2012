class CustomFrameLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :custom_frame_model_id, :integer
  end

  def self.down
  end
end
