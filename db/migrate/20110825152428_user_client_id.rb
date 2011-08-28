class UserClientId < ActiveRecord::Migration
  def self.up
    add_column :users, :client_id, :integer
  end

  def self.down
  end
end
