class AddBottomBracketId < ActiveRecord::Migration
  def self.up
    add_column :line_items, :bottom_bracket_id, :integer
  end

  def self.down
  end
end
