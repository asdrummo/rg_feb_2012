class CreateComponentsFrontBrakes < ActiveRecord::Migration
  def self.up
    create_table :components_front_brakes do |t|
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
      t.string :pull
      t.decimal :mount_high, :precision => 8, :scale => 2
      t.decimal :mount_low, :precision => 8, :scale => 2
      t.decimal :front_tire_max_width, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :components_front_brakes
  end
end
