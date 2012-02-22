class Size < ActiveRecord::Migration
  def self.up
    add_column :components, :size, :string
  end

  def self.down
    remove_column :components, :size
    
  end
end
