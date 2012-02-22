class CreateAccessories < ActiveRecord::Migration
  def self.up
    create_table :accessories do |t|
      t.string :product_id
      t.string :name
      t.text :description
      t.decimal :price, :price, :precision => 8, :scale => 2
      t.string :size
      t.string :color
      t.integer :client_id
      t.string :image_path, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :accessories
  end
end
