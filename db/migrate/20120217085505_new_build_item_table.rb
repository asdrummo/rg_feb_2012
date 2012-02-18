class NewBuildItemTable < ActiveRecord::Migration
  def self.up
    create_table :customer_build_items do |t|
    t.integer :order_id
    t.integer :client_id
    t.integer :price, :precision=> 5, :scale => 2
    t.integer :frame_model_id
    t.integer :custom_frame_model_id
    t.integer :component_id
    t.integer :frame_model_size_id
    t.integer :gear_id
    t.integer :top_tube_style_id
    t.timestamps
    end
  end
  def self.down
  end
end
