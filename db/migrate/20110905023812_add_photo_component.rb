class AddPhotoComponent < ActiveRecord::Migration
  def self.up
    add_column :photos, :component_id, :integer
  end

  def self.down
  end
end
