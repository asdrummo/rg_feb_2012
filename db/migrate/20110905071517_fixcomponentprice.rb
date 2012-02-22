class Fixcomponentprice < ActiveRecord::Migration
  def self.up
    change_column :components, :price, :decimal, :precision => 8, :scale => 2
    change_column :components, :cost, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
