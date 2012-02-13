class FixDerailleurSpelling < ActiveRecord::Migration
  def self.up
    rename_column :components, :rear_deraileur_type, :rear_derailleur_type
    rename_column :components, :front_deraileur_type, :front_derailleur_type
    rename_column :component_packages, :rear_deraileur_id, :rear_derailleur_id
    rename_column :component_packages, :front_deraileur_id, :front_derailleur_id
    
    
  end

  def self.down
  end
end
