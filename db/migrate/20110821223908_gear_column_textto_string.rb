class GearColumnTexttoString < ActiveRecord::Migration
  def self.up
    change_column :frame_models, :gears, :string
  end

  def self.down
  end
end
