class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :workshop_id
      t.integer :quantity, :limit => 5
      t.decimal :price, :decimal, :precision => 10, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
