class BuildSaving < ActiveRecord::Migration
  def self.up
    remove_column :customer_builds, :invoice_number
    remove_column :customer_builds, :status
    remove_column :customer_builds, :shipping_id
    
    remove_column :customer_build_items, :product_id
    remove_column :customer_build_items, :name
    remove_column :customer_build_items, :description
    remove_column :customer_build_items, :price
   
  end

  def self.down
  end
end
