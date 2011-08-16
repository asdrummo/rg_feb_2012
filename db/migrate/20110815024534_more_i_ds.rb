class MoreIDs < ActiveRecord::Migration
  def self.up


      add_column :component_packages, :rear_wheel_id, :integer
      
       rename_column :component_packages, :tire_id, :front_tire_id
        add_column :component_packages, :rear_tire_id, :integer
        
         rename_column :component_packages, :tube_id, :front_tube_id
          add_column :component_packages, :rear_tube_id, :integer
          
            add_column :component_packages, :front_shifter_id, :integer
            add_column :component_packages, :rear_shifter_id, :integer
    
    
  end

  def self.down
  end
end
