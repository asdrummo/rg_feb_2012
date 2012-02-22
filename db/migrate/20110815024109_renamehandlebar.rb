class Renamehandlebar < ActiveRecord::Migration
  def self.up
    rename_column :component_packages, :handle_bar_id, :handlebar_id
  end

  def self.down
  end
end
