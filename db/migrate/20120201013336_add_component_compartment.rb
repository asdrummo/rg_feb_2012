class AddComponentCompartment < ActiveRecord::Migration
  def self.up
    add_column :components, :compartment, :string
  end

  def self.down
  end
end
