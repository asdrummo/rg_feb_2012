class SessionData < ActiveRecord::Migration
  def self.up
    change_column :sessions, :data, :longtext
  end

  def self.down
  end
end
