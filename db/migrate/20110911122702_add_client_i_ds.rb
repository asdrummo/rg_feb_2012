class AddClientIDs < ActiveRecord::Migration
  def self.up
    change_column :accessories, :client_id, :string
    add_column :component_packages, :client_id, :string
    change_column :components, :client_id, :string
    add_column :frame_models, :client_id, :string
    change_column :line_items, :client_id, :string
    change_column :users, :client_id, :string
  end

  def self.down
  end
end
