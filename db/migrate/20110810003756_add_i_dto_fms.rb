class AddIDtoFms < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :frame_model_size, :frame_model_size_id
  end

  def self.down
  end
end
