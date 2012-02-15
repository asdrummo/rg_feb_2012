class FinishingSpecs < ActiveRecord::Migration
  def self.up
    #add_column :components, :seat_tube_inner_diameter, :integer
    #add_column :frame_models, :seat_tube_inner_diameter, :integer
    #add_column :custom_frame_models, :seat_tube_inner_diameter, :integer
    #add_column :components, :seat_tube_outer_diameter, :integer
    #add_column :frame_models, :seat_tube_outer_diameter, :integer
    #add_column :custom_frame_models, :seat_tube_outer_diameter, :integer
    #add_column :components, :clamp, :string
    #add_column :components, :pedal_strap, :string
    #add_column :components, :attachment_type, :string
    #remove_column :components, :pull
    #remove_column :components, :strap
    #remove_column :components, :wheel_rim_width
    #remove_column :components, :size
    #remove_column :components, :teeth
    #add_column :components, :brake_mount_to_hub, :integer
    add_column :components, :teeth
    
    
    
    
    
  end

  def self.down
  end
end
