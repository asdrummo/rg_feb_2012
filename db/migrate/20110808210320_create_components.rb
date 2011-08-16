class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :product_id
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
