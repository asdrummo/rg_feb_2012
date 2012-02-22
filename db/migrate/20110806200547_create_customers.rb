class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :phone_number, :limit => 10
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
