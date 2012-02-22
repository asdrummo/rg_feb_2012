class OrderStatus < ActiveRecord::Migration
  def self.up
    add_column :orders, :status, :string
  end

  def self.down
  end
end
