class AddMoreToFrame < ActiveRecord::Migration
  def self.up
    add_column :frame_models, :head_tube_inner_diameter, :integer
  end

  def self.down
  end
end
