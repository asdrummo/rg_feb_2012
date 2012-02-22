class AddLineItemColumns < ActiveRecord::Migration
  def self.up
    add_column :line_items, :component_package_id, :integer
    add_column :line_items, :accessory_id, :integer
    rename_table :components, :component_packages 
  end

  def self.down
  end
end
