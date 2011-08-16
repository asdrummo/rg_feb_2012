class FixTopTubePrice < ActiveRecord::Migration
  def self.up
    change_column(:top_tube_styles, :price, :decimal, :precision => 8, :scale => 2)
  end

  def self.down
  end
end
