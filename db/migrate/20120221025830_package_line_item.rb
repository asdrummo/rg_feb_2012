class PackageLineItem < ActiveRecord::Migration
  def self.up
    add_column :customer_build_items, :component_package_id, :integer
  end

  def self.down
    remove_column :customer_build_items, :component_package_id
    
  end
end
