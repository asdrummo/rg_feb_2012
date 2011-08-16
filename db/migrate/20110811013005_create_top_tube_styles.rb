class CreateTopTubeStyles < ActiveRecord::Migration
  def self.up
    create_table :top_tube_styles do |t|
      t.string :name
      t.string :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :top_tube_styles
  end
end
