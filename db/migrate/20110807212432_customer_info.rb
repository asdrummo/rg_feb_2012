class CustomerInfo < ActiveRecord::Migration
  def self.up
    add_column :customers, :country, :string 
    add_column :customers, :username, :string, :limit => 25
    add_column :customers, :email, :string, :default => "", :null => false, :limit => 100
    add_column :customers, :hashed_password, :string, :limit => 40
    add_column :customers, :salt, :string, :limit => 40
  end

  def self.down
  end
end
