class RemoveTypeFromComponents < ActiveRecord::Migration
  def self.up
    remove_column :components, :type
  end

  def self.down
  end
end
