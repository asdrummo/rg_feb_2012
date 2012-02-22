class AddColumnPriceWorkshop < ActiveRecord::Migration
  def self.up
    add_column :workshops, :price, :decimal, :precision => 8, :scale => 2
    rename_column :workshops, :date, :start_date
    add_column :workshops, :end_date, :datetime
  end

  def self.down
  end
end
