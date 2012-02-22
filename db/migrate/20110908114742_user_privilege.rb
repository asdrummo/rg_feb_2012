class UserPrivilege < ActiveRecord::Migration
  def self.up
  add_column :users, :privilege, :string
  end

  def self.down
  end
end
