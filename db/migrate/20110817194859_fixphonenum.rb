class Fixphonenum < ActiveRecord::Migration
  def self.up
    change_column :customers, :phone_number, :string
  end

  def self.down
  end
end
