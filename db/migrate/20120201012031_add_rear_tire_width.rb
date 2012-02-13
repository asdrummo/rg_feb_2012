class AddRearTireWidth < ActiveRecord::Migration
  def self.up
    add_column :components, :rear_tire_width, :decimal
    add_column :components, :rear_tire_size, :decimal
  end

  def self.down
  end
end
