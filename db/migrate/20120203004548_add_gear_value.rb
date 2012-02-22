class AddGearValue < ActiveRecord::Migration
  def self.up
    add_column :gears, :num_gears, :integer
  end

  def self.down
  end
end
