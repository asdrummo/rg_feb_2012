class FrameRearDeraileurMount < ActiveRecord::Migration
  def self.up
    add_column :frame_models, :rear_derailleur_mount, :string
  end

  def self.down
  end
end
