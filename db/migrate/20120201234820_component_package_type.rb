class ComponentPackageType < ActiveRecord::Migration
  def self.up
    rename_column :component_packages, :type, :package_type
  end

  def self.down
  end
end
