class AddFmStoLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :frame_model_size, :integer
  end

  def self.down
  end
end
