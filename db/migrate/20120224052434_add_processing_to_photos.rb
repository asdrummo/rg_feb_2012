class AddProcessingToPhotos < ActiveRecord::Migration
    def self.up
      add_column :photos, :processing, :boolean
    end

    def self.down
      remove_column :photos, :processing
    end
  end