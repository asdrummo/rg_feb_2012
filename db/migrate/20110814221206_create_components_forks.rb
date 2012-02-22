class CreateComponentsForks < ActiveRecord::Migration
  def self.up

    

    rename_column :components_stems, :components_steerer_tube_inner_diameter, :steerer_tube_length
  end

  def self.down
    drop_table :components_forks
  end
end
