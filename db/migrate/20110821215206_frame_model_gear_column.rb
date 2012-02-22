class FrameModelGearColumn < ActiveRecord::Migration
  def self.up
    add_column :frame_models, :gears, :text
  end

  def self.down
  end
end
