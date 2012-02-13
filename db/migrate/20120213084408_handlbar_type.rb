class HandlbarType < ActiveRecord::Migration
  def self.up
    #add_column :components, :handlebar_type, :string    
    #remove_column :components, :stem_clamp_high
    #remove_column :components, :stem_clamp_low
    
    #rename_column :components, :front_tire_max_width, :tire_max_width
    #remove_column :components, :rear_tire_width_max
    #rename_column :components, :front_tire_width, :tire_width
    #remove_column :components, :rear_tire_width
    #rename_column :components, :front_tire_size, :tire_size
    #remove_column :components, :rear_tire_size
    #rename_column :components, :max_size, :tire_max_size
    #rename_column :components, :front_wheel_rim_width, :wheel_rim_width
    #remove_column :components, :rear_wheel_rim_width
    #rename_column :components, :front_wheel_size, :wheel_size
    #remove_column :components, :rear_wheel_size
    #rename_column :components, :front_brake_type, :brake_type 
    #remove_column :components, :rear_brake_type
    #rename_column :components, :front_brake_pull, :brake_pull
    #remove_column :components, :rear_brake_pull
    add_column :frame_models, :front_brake_pull, :string
    add_column :frame_models, :rear_brake_pull, :string
    
  end

  def self.down
  end
end
