class CustomerShipping < ActiveRecord::Migration
  def self.up
    add_column :shipping_addresses, :country, :string
    
  end

  def self.down
  end
end
