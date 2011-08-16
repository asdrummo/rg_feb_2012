class LineItemFrameModelId < ActiveRecord::Migration
  def self.up
    add_column :line_items, :frame_model_id, :integer
    add_column :line_items, :component_id, :integer
  end

  def self.down
  end
end
