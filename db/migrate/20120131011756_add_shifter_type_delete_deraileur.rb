class AddShifterTypeDeleteDeraileur < ActiveRecord::Migration
  def self.up
    remove_column :components, :front_deraleur_type
    add_column :components, :shifter_type, :string
  end

  def self.down
  end
end
