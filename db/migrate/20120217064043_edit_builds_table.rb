class EditBuildsTable < ActiveRecord::Migration
  def self.up
    #add_column :builds, :customer_id, :integer
    add_column :builds, :frame_model_size_id, :integer
    add_column :builds, :top_tube_style_id, :integer
    add_column :builds, :gear_id, :integer
    add_column :builds, :component_package_full_id, :integer
    add_column :builds, :component_package_drivetrain_id, :integer
    add_column :builds, :component_package_front_end_id, :integer
    add_column :builds, :component_package_wheels_id, :integer
    add_column :builds, :component_package_finishing_id, :integer
  end

  def self.down
    remove_column :builds, :customer_id
    remove_column :builds, :frame_model_size_id
    remove_column :builds, :top_tube_style_id
    remove_column :builds, :gear_id
    remove_column :builds, :component_package_full_id
    remove_column :builds, :component_package_drivetrain_id
    remove_column :builds, :component_package_front_end_id
    remove_column :builds, :component_package_wheels_id
    remove_column :builds, :component_package_finishing_id
  end
end
