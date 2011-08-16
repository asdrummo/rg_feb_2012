class CreateComponentsRearWheels < ActiveRecord::Migration
  def self.up
    create_table :components_rear_wheels do |t|
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
      t.decimal :hub_width, :precision => 8, :scale => 2
      t.string :size
      t.decimal :rim_width, :precision => 8, :scale => 2
      t.string :rear_brake_type
      t.string :cog_spline_thread

      t.timestamps
    end
  end

  def self.down
    drop_table :components_rear_wheels
  end
end
