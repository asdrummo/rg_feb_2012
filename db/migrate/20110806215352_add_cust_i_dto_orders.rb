class AddCustIDtoOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :customer_id, :integer
  end

  def self.down
  end
end
