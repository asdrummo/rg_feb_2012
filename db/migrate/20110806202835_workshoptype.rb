class Workshoptype < ActiveRecord::Migration
  def self.up
    rename_column :workshops, :type, :experience
  end

  def self.down
  end
end
