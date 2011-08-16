class AddComponentColumns < ActiveRecord::Migration
  def self.up
    add_column :component_packages, :seat_post_id, :integer
    add_column :component_packages, :seat_clamp_id, :integer
    add_column :component_packages, :stem_id, :integer
    add_column :component_packages, :handle_bar_id, :integer
    add_column :component_packages, :lever_id, :integer
    add_column :component_packages, :fork_id, :integer
    add_column :component_packages, :headset_id, :integer
    add_column :component_packages, :spacers_id, :integer
    add_column :component_packages, :wheel_id, :integer
    add_column :component_packages, :rim_stip_id, :integer
    add_column :component_packages, :tire_id, :integer
    add_column :component_packages, :tube_id, :integer
    add_column :component_packages, :cog_id, :integer
    add_column :component_packages, :bolt_id, :integer
    add_column :component_packages, :coaster_break_strap_id, :integer
    add_column :component_packages, :brake_id, :integer
    add_column :component_packages, :bottom_bracket_id, :integer
    add_column :component_packages, :crank_id, :integer
    add_column :component_packages, :chain_ring_id, :integer
    add_column :component_packages, :chain_id, :integer
    add_column :component_packages, :half_link_id, :integer
    add_column :component_packages, :grip_id, :integer
    add_column :component_packages, :pedal_id, :integer
    add_column :component_packages, :seat_id, :integer
  end

  def self.down
  end
end
