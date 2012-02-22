class FrameModelSizeColumn < ActiveRecord::Migration
  def self.up
    add_column :frame_models, :sizes, :string
  end

  def self.down
  end
end
