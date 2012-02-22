class FrameModelClientId < ActiveRecord::Migration
  def self.up
    add_column :line_items, :client_id, :integer
    add_column :line_items, :status, :string
    add_column :line_items, :tracking, :string
  end

  def self.down
  end
end
