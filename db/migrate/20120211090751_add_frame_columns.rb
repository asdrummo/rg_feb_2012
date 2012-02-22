class AddFrameColumns < ActiveRecord::Migration
  def self.up
    rename_column :components, :steerer_tube_diameter, :steer_tube_length

  end

  def self.down
  end
end
