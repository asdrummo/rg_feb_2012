class CreateComponentsRearBrakes < ActiveRecord::Migration
  def self.up
    create_table :components_rear_brakes do |t|
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
      t.string :type
      t.decimal :rear_tire_width_max, :precision => 8, :scale => 2
      t.string :rear_wheel_size
      t.decimal :rear_wheel_rim_width, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :components_rear_brakes
  end
end
