class FrameOptionsColumn < ActiveRecord::Migration
  def self.up
    add_column :frame_models, :options, :integer
  end

  def self.down
  end
end
