class PhotosIdColumns < ActiveRecord::Migration
  def self.up
    add_column :photos, :bottom_bracket_id, :integer
    add_column :photos, :front_brake_id, :integer
  end

  def self.down
    remove_column :photos, :bottom_bracket_id
    remove_column :photos, :front_brake_id
  end
end
