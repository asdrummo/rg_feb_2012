class Attmpt2FixText < ActiveRecord::Migration
  def self.up


    remove_column :sessions, :data_entered_string

  end

  def self.down
  end
end
