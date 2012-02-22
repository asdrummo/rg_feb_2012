class CrankId < ActiveRecord::Migration
  def self.up
    add_column :line_items, :crank_id, :integer
  end

  def self.down
  end
end
