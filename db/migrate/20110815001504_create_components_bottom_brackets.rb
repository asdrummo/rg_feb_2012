class CreateComponentsBottomBrackets < ActiveRecord::Migration
  def self.up
    create_table :components_bottom_brackets do |t|
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
      t.string :threading
      t.integer :num_bolts
      t.decimal :spacing, :precision => 8, :scale => 2
      t.string :bolt
      t.string :taper
      t.decimal :width, :precision => 8, :scale => 2
      t.decimal :shell_width, :precision => 8, :scale => 2
      t.decimal :qfactor, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :components_bottom_brackets
  end
end
