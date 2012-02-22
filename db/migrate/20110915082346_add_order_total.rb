class AddOrderTotal < ActiveRecord::Migration
  def self.up
    add_column :customers, :payment_processor_subscription_id, :integer
  end

  def self.down
  end
end
