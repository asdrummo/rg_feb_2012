class ComponentPackagesFinishing < ActiveRecord::Migration
  def self.up
    #add_column :component_packages, :saddle_id, :integer
    #add_column :component_packages, :seat_post_id, :integer
    #add_column :component_packages, :seat_clamp_id, :integer
    #add_column :component_packages, :grip_id, :integer
    #add_column :component_packages, :pedal_id, :integer
    add_column :component_packages, :pedal_strap, :integer

  end

  def self.down
    #remove_column :component_packages, :saddle_id
    #remove_column :component_packages, :seat_post_id
    #remove_column :component_packages, :seat_clamp_id
    #remove_column :component_packages, :grip_id
    #remove_column :component_packages, :pedal_id
    remove_column :component_packages, :pedal_strap
  end
end
