class GearPricetoDecimal < ActiveRecord::Migration
  def self.up
    change_column(:gears, :price, :decimal, :precision => 8, :scale => 2)
  end

  def self.down
  end
end
