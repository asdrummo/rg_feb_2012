class BuildItemPrice < ActiveRecord::Migration
  def self.up
    add_column :customer_build_items, :price, :decimal, :precision => 8, :scale => 2
    add_column :customer_build_items, :customer_build_id, :integer
  end

  def self.down
    remove_column :customer_build_items, :price
  end
end
