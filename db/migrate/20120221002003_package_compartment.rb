class PackageCompartment < ActiveRecord::Migration
  def self.up
    add_column :component_packages, :compartment, :string
  end

  def self.down
    remove_column :component_packages, :compartment
  end
end
