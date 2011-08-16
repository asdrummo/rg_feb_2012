class AddColumnsLiGearTopTube < ActiveRecord::Migration
  def self.up
    add_column :line_items, :gear_id, :integer
    add_column :line_items, :top_tube_style_id, :integer
  end

  def self.down
  end
end
