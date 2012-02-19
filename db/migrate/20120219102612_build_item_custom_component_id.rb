class BuildItemCustomComponentId < ActiveRecord::Migration
  def self.up
    add_column :customer_build_items, :custom_component_id, :integer
  end

  def self.down
  end
end
