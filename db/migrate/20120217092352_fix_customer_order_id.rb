class FixCustomerOrderId < ActiveRecord::Migration
  def self.up
    #rename_column :customer_build_items, :order_id, :customer_build_id
    #remove_column :customer_build_items, :client_id
  end

  def self.down
    #rename_column :customer_build_items, :customer_build_id, :order_id
    add_column :customer_build_items, :client_id, :integer
  end
end
