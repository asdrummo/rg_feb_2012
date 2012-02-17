class FixPedalStrap < ActiveRecord::Migration
  def self.up
    rename_column :component_packages, :pedal_strap, :pedal_strap_id
  end

  def self.down
    rename_column :component_packages, :pedal_strap_id, :pedal_strap
    
  end
end
