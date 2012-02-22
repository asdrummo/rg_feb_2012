class AddBuildtoCart < ActiveRecord::Migration
  def self.up
    add_column :line_items, :customer_build_id, :integer
    add_column :customer_builds, :price, :decimal, :precision => 8, :scale => 2
    
  end

  def self.down
    #remove_column :line_items, :build_id
    
  end
end
