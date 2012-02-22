class CreateFrontDeraileurs < ActiveRecord::Migration
  def self.up
    create_table :components_front_deraileurs do |t|
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
      t.string :mount
      t.string :type
      t.string :shifter_type
      t.timestamps
    end
  end
  
  create_table :components_rear_deraileurs do |t|
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
    t.string :mount
    t.string :type
    t.string :shifter_type
    t.decimal :chain_width, :precision => 8, :scale => 2
    t.integer :cognum
    
    t.timestamps
  end
  
  create_table :components_front_shifters do |t|
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
    t.string :front_deraileur_type
    t.decimal :clamp_diameter_low, :precision => 8, :scale => 2
    t.decimal :clamp_diameter_high, :precision => 8, :scale => 2
    t.string :bar_type
    t.integer :max_turn_size
    t.timestamps
  end
  
  create_table :components_rear_shifters do |t|
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
    t.string :rear_deraileur_type
    t.decimal :clamp_diameter_low, :precision => 8, :scale => 2
    t.decimal :clamp_diameter_high, :precision => 8, :scale => 2
    t.string :bar_type
    t.integer :max_turn_size
    t.timestamps
  end

  def self.down
    drop_table :front_deraileurs
  end
end
