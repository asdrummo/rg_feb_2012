class AddComponentName < ActiveRecord::Migration
  def self.up
    add_column :line_items, :component_name, :string
  end

  def self.down
  end
end
