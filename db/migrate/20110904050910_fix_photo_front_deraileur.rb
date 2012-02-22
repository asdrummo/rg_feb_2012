class FixPhotoFrontDeraileur < ActiveRecord::Migration
  def self.up
    rename_column :photos, :front_deraileur, :front_deraileur_id
  end

  def self.down
  end
end
