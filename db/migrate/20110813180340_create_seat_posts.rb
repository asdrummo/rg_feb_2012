class CreateSeatPosts < ActiveRecord::Migration
  def self.up
    create_table :seat_posts do |t|
      t.integer :client_id
      t.string :sku
      t.string :name
      t.text :description
      t.string :image_path
      t.integer :product_id
      t.string :vendor
      t.string :brand
      t.string :material
      t.string :color
      t.string :finish
      t.decimal :cost,:precision => 8, :scale => 2
      t.string :price,:precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :seat_posts
  end
end
