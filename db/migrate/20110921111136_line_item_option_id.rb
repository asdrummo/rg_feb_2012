class LineItemOptionId < ActiveRecord::Migration
  def self.up



    remove_column :line_items, :saddle_id
  end

  def self.down
  end
end
