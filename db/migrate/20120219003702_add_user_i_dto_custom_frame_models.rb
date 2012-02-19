class AddUserIDtoCustomFrameModels < ActiveRecord::Migration
  def self.up
    #add_column :custom_frame_models, :customer_id, :integer
    #add_column :customer_build_items, :compartment, :string
    add_column :custom_components, :customer_id, :integer
  end

  def self.down
    #remove_column :customer_build_items, :customer_id
    
  end
end
