class ComponentsRdMount < ActiveRecord::Migration
  def self.up
    add_column :components, :rear_derailleur_mount, :string
  end

  def self.down
  end
end
