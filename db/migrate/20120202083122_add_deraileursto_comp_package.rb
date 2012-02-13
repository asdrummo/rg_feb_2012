class AddDeraileurstoCompPackage < ActiveRecord::Migration
  def self.up
    add_column :component_packages, :front_deraileur_id, :integer
    add_column :component_packages, :rear_deraileur_id, :integer
    
  end

  def self.down
  end
end
