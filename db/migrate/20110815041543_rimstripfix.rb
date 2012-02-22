class Rimstripfix < ActiveRecord::Migration
  def self.up
    rename_column :component_packages, :rim_stip_id, :rim_strip_id
  end

  def self.down
  end
end
