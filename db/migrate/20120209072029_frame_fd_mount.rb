class FrameFdMount < ActiveRecord::Migration
  def self.up
    add_column :components, :front_derailleur_mount, :string
  end

  def self.down
  end
end
