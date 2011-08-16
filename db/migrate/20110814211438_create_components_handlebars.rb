class CreateComponentsHandlebars < ActiveRecord::Migration
  def self.up
    create_table :components_handlebars do |t|
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
      t.decimal :clamp_diamter, :precision => 8, :scale => 2
      t.decimal :tube, :precision => 8, :scale => 2
      t.string :type
      t.decimal :stem_clamp_diamter, :precision => 8, :scale => 2
      t.decimal :max_turn_size, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :components_handlebars
  end
end
