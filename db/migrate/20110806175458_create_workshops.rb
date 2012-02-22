class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :client_id, :limit => 3 # i.e. bbs
      t.string :type # i.e bike, powdercoat, buildup
      t.string :location #city, state
      t.datetime :date
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
