class Addstuff < ActiveRecord::Migration
  def self.up
    #add_column :frame_models, :bottom_bracket_width, :decimal, :precision=> 5, :scale => 2
    #add_column :frame_models, :bottom_bracket_shell_width, :integer
    #add_column :frame_models, :bottom_bracket_thread, :string
    #add_column :components, :weight, :decimal, :precision=> 5, :scale => 1
    #rename_column :frame_models, :bottom_bracket_thread, :bottom_bracket_threading
    add_column :frame_models, :clearance, :decimal, :precision=> 5, :scale => 2
    
    
    
  end

  def self.down
  end
end
