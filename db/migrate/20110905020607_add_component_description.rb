class AddComponentDescription < ActiveRecord::Migration
  def self.up
    add_column :components, :description, :text
  end

  def self.down
  end
end
