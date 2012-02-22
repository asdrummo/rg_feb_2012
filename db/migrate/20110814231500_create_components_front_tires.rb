class CreateComponentsFrontTires < ActiveRecord::Migration
  def self.up
    create_table :components_front_tires do |t|
      t.integer :client_id
      t.string :product_id
      t.string :sku
      t.string :name
      t.text :description
      t.string :image_path
      t.string :vendor
      t.string :brand
      t.string :material
      t.string :color
      t.string :finish
      t.decimal :cost, :precision => 8, :scale => 2
      t.decimal :price, :precision => 8, :scale => 2
      t.string :size
      t.decimal :width, :precision => 8, :scale => 2
      t.decimal :max_size, :precision => 8, :scale => 2
      t.string :front_wheel_size
      t.decimal :front_wheel_trim_width, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :components_front_tires
  end
end
