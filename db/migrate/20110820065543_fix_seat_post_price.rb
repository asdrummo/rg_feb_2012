class FixSeatPostPrice < ActiveRecord::Migration
  def self.up
    change_column :components_seat_posts, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
