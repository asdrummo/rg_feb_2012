class RenameSeatPostsTable < ActiveRecord::Migration
  def self.up
  
  end

  def self.down
    rename_table :component_seat_posts, :components_seat_posts
  end
end
