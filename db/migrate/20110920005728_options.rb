class Options < ActiveRecord::Migration
  def self.up
    
    add_column :options, :quantity, :integer
      
  end

  def self.down
  end
end
