class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :frame_model_sizes do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :frame_model_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end
