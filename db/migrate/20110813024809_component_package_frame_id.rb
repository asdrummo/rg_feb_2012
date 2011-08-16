class ComponentPackageFrameId < ActiveRecord::Migration
  def self.up
    add_column :component_packages, :frame_model_id, :integer
  end

  def self.down
  end
end
