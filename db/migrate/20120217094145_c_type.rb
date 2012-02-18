class CType < ActiveRecord::Migration
  def self.up
    add_column :customer_build_items, :component_type, :string
  end

  def self.down
     remove_column :customer_build_items, :compartment_type
  end
end
