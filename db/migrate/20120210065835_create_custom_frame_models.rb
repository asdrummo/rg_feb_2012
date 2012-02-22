class CreateCustomFrameModels < ActiveRecord::Migration
  def self.up
    create_table :custom_frame_models do |t|
    t.string :name
    t.integer :gears  
    t.string :rear_derailleur_mount
    t.string :front_derailleur_mount
    t.decimal :bottom_bracket_width, :precision=> 5, :scale => 2
    t.decimal :bottom_bracket_shell_width, :precision=> 5, :scale => 2
    t.string :bottom_bracket_threading
    t.decimal :clearance, :precision=> 5, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :custom_frame_models
  end
end
