class CreateGears < ActiveRecord::Migration
  def self.up
    create_table :gears do |t|
      t.string :name
      t.string :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :gears
  end
end
