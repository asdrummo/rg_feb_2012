class FixClampHigh < ActiveRecord::Migration
  def self.up
    
    rename_column :components, :clamp_diamter_high, :clamp_diameter_high
  end

  def self.down
  end
end
