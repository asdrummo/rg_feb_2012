class RearTireMaxWidth < ActiveRecord::Migration
  def self.up
    rename_column :components, :rear_tire_max_width, :rear_tire_width_max
  end

  def self.down
    rename_column :components, :max_tire_width, :rear_tire_max_width
  end
end
