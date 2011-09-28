class AddComponentName < ActiveRecord::Migration
  def self.up
    add_column :line_items, :component_name, :string
    add_column :options, :component_id, :integer
    add_column :options, :frame_model_id, :integer
    remove_column :line_items, :seat_post_id
    remove_column :line_items, :seat_clamp_id
    remove_column :line_items, :stem_id
    remove_column :line_items, :handle_bar_id
    remove_column :line_items, :lever_id
    remove_column :line_items, :front_deraileur_id
    remove_column :line_items, :front_shifter_id
    remove_column :line_items, :rear_deraileur_id
    remove_column :line_items, :rear_shifter_id
    remove_column :line_items, :fork_id
    remove_column :line_items, :headset_id
    remove_column :line_items, :spacers_id
    remove_column :line_items, :wheel_id
    remove_column :line_items, :rim_stip_id
    remove_column :line_items, :tire_id
    remove_column :line_items, :tube_id
    remove_column :line_items, :cog_id
    remove_column :line_items, :bolt_id
    remove_column :line_items, :coaster_break_strap_id
    remove_column :line_items, :brake_id
    remove_column :line_items, :bottom_bracket_id
    remove_column :line_items, :crank_id
    remove_column :line_items, :chain_ring_id
    remove_column :line_items, :chain_id
    remove_column :line_items, :half_link_id
    remove_column :line_items, :grip_id
    remove_column :line_items, :pedal_id
    remove_column :line_items, :seat_id
  end

  def self.down
  end
end
