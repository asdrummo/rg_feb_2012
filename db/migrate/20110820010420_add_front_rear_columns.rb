class AddFrontRearColumns < ActiveRecord::Migration
  def self.up
    add_column :line_items, :front_brake_id, :string
    add_column :line_items, :rear_brake_id, :string
    add_column :line_items, :chain_id, :string
    add_column :line_items, :chainring_id, :string
    add_column :line_items, :cog_id, :string
    add_column :line_items, :fork_id, :string
    add_column :line_items, :grip_id, :string
    add_column :line_items, :half_link_id, :string
    add_column :line_items, :handlebar_id, :string
    add_column :line_items, :headset_id, :string
    add_column :line_items, :front_lever_id, :string
    add_column :line_items, :rear_lever_id, :string
    add_column :line_items, :pedal_id, :string
    add_column :line_items, :rim_strip_id, :string
    add_column :line_items, :saddle_id, :string
    add_column :line_items, :seat_clamp_id, :string
    add_column :line_items, :seat_post_id, :string
    add_column :line_items, :front_shifter_id, :string
    add_column :line_items, :rear_shifter_id, :string
    add_column :line_items, :stem_id, :string
    add_column :line_items, :front_tire_id, :string
    add_column :line_items, :rear_tire_id, :string
    add_column :line_items, :front_tube_id, :string
    add_column :line_items, :rear_tube_id, :string
    add_column :line_items, :front_wheel_id, :string
    add_column :line_items, :rear_wheel_id, :string
  end

  def self.down
  end
end
