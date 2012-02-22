class WorkshopColumnAddress < ActiveRecord::Migration
  def self.up
    add_column :workshops, :address, :string
  end

  def self.down
  end
end
