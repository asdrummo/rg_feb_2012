class PhotoColumnAccessories < ActiveRecord::Migration
  def self.up
    add_column :photos, :accessory_id, :integer
    add_column :photos, :component_package_id, :integer
    add_column :photos, :frame_model, :integer
  end

  def self.down
  end
end
