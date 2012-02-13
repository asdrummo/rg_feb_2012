class GearFdType < ActiveRecord::Migration
  def self.up
    add_column :gears, :front_derailleur_type, :string
  end

  def self.down
  end
end
