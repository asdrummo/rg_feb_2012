class AddKitColumnFrameModels < ActiveRecord::Migration
  def self.up
    change_column_default(:frame_models, :kit, false)
  end

  def self.down
  end
end
