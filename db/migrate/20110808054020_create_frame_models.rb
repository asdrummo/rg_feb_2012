class CreateFrameModels < ActiveRecord::Migration
  def self.up
    create_table :frame_models do |t|
      t.integer :product_id
      t.string :name
      t.text :description
      t.string :image_path
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :frame_models
  end
end
