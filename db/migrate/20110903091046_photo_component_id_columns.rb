class PhotoComponentIdColumns < ActiveRecord::Migration
  def self.up
    add_column :photos, :chainring_id, :integer
    add_column :photos, :chain_id, :integer
    add_column :photos, :cog_id, :integer
    add_column :photos, :crank_id, :integer
    add_column :photos, :fork_id, :integer
    add_column :photos, :front_deraileur, :integer
    add_column :photos, :front_lever_id, :integer
    add_column :photos, :front_shifter_id, :integer
    add_column :photos, :front_tire_id, :integer
    add_column :photos, :front_tube_id, :integer
    add_column :photos, :front_wheel_id, :integer
    add_column :photos, :grip_id, :integer
    add_column :photos, :half_link_id, :integer
    add_column :photos, :handlebar_id, :integer
    add_column :photos, :headset_id, :integer
    add_column :photos, :pedal_id, :integer
    add_column :photos, :rear_brake_id, :integer
    add_column :photos, :rear_deraileur_id, :integer
    add_column :photos, :rear_lever_id, :integer
    add_column :photos, :rear_shifter_id, :integer
    add_column :photos, :rear_tire_id, :integer
    add_column :photos, :rear_tube_id, :integer
    add_column :photos, :rear_wheel_id, :integer
    add_column :photos, :rim_strip_id, :integer
    add_column :photos, :saddle_id, :integer
    add_column :photos, :seat_clamp_id, :integer
    add_column :photos, :seat_post_id, :integer
    add_column :photos, :stem_id, :integer
  end

  def self.down
      remove_column :photos, :chainring_id
      remove_column :photos, :chain_id
      remove_column :photos, :cog_id
      remove_column :photos, :crank_id
      remove_column :photos, :fork_id
      remove_column :photos, :front_deraileur_id
      remove_column :photos, :front_lever_id
      remove_column :photos, :front_shifter_id
      remove_column :photos, :front_tire_id
      remove_column :photos, :front_tube_id
      remove_column :photos, :front_wheel_id
      remove_column :photos, :grip_id
      remove_column :photos, :half_link_id
      remove_column :photos, :handlebar_id
      remove_column :photos, :headset_id
      remove_column :photos, :pedal_id
      remove_column :photos, :rear_brake_id
      remove_column :photos, :rear_deraileur_id
      remove_column :photos, :rear_lever_id
      remove_column :photos, :rear_shifter_id
      remove_column :photos, :rear_tire_id
      remove_column :photos, :rear_tube_id
      remove_column :photos, :rear_wheel_id
      remove_column :photos, :rim_strip_id
      remove_column :photos, :saddle_id
      remove_column :photos, :seat_clamp_id
      remove_column :photos, :seat_post_id
      remove_column :photos, :stem_id
      remove_column :photos, :bottom_bracket_id
      remove_column :photos, :front_brake_id
      
    end
end
