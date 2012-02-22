class CreatePhotos < ActiveRecord::Migration

  
  
  def self.up
    add_column :photos, :data_file_name, :string
    add_column :photos, :data_content_type, :string
    add_column :photos, :data_file_size, :integer
    add_column :photos, :data_updated_at, :datetime
  end

  def self.down
    add_column :photos, :data_file_name, :string
     add_column :photos, :data_content_type, :string
     add_column :photos, :data_file_size, :integer
     add_column :photos, :data_updated_at, :datetime
  end
end
