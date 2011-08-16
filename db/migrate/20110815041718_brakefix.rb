class Brakefix < ActiveRecord::Migration
  def self.up
   
  
  end

  def self.down
     rename_column :component_packages, :seat_id, :saddle_id
  end
end
