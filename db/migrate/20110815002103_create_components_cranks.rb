class CreateComponentsCranks < ActiveRecord::Migration
  def self.up
    create_table :components_cranks do |t|
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
      t.integer :num_bolts
      t.decimal :bcd, :precision => 8, :scale => 2
      t.string :taper
      t.string :front_deraleur_type

      t.timestamps
    end
  end

  def self.down
    drop_table :components_cranks
  end
end
