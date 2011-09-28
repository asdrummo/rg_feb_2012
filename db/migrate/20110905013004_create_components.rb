class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.integer :client_id
      t.string :component_type
      t.integer :product_id
      t.string :sku
      t.string :name
      t.string :image_path
      t.string :vendor
      t.string :brand
      t.string :material
      t.string :color
      t.string :finish
      t.decimal :cost
      t.decimal :price
      t.decimal :stem_clamp_diameter, :precision => 8, :scale => 2
      t.decimal :steer_tube_diameter, :precision => 8, :scale => 2
      t.decimal :steer_tube_inner_diameter, :precision => 8, :scale => 2
      t.decimal :stem_clamp_low, :precision => 8, :scale => 2
      t.decimal :stem_clamp_high, :precision => 8, :scale => 2
      t.decimal :clamp_diameter, :precision => 8, :scale => 2
      t.decimal :tube, :precision => 8, :scale => 2
      t.string :type
      t.decimal :max_turn_size, :precision => 8, :scale => 2
      t.decimal :clamp_diamter_high, :precision => 8, :scale => 2
      t.decimal :clamp_diameter_low, :precision => 8, :scale => 2
      t.string :bar_type
      t.string :rear_brake_type
      t.string :rear_brake_pull
      t.string :front_brake_type
      t.string :front_brake_pull
      t.decimal :head_tube_inner_diameter, :precision => 8, :scale => 2
      t.decimal :steerer_tube_diameter, :precision => 8, :scale => 2
      t.decimal :crown_race_diameter, :precision => 8, :scale => 2
      t.decimal :tube_width, :precision => 8, :scale => 2
      t.string :size
      t.string :front_brake_type
      t.decimal :hub_width, :precision => 8, :scale => 2
      t.decimal :hub_width, :precision => 8, :scale => 2
      t.decimal :rim_width, :precision => 8, :scale => 2
      t.string :rear_brake_type
      t.string :cog_spline_thread
      t.decimal :width, :precision => 8, :scale => 2
      t.decimal :max_size, :precision => 8, :scale => 2
      t.string :front_wheel_size
      t.decimal :front_wheel_rim_width, :precision => 8, :scale => 2
      t.string :rear_wheel_size
      t.decimal :rear_wheel_rim_width, :precision => 8, :scale => 2
      t.decimal :front_tire_width, :precision => 8, :scale => 2
      t.string :front_tire_size
      t.integer :num_bolts
      t.integer :teeth
      t.decimal :chain_width, :precision => 8, :scale => 2
      t.string :rear_deraileur_type
      t.string :spline_thread_type
      t.integer :cog_number
      t.string :pull
      t.decimal :mount_high, :precision => 8, :scale => 2
      t.decimal :mount_low, :precision => 8, :scale => 2
      t.decimal :front_tire_max_width, :precision => 8, :scale => 2
      t.string :threading
      t.decimal :spacing, :precision => 8, :scale => 2
      t.string :bolt
      t.string :taper
      t.decimal :shell_width, :precision => 8, :scale => 2
      t.decimal :qfactor, :precision => 8, :scale => 2
      t.decimal :bcd, :precision => 8, :scale => 2
      t.string :front_deraleur_type
      t.integer :teeth
      t.decimal :chain_width, :precision => 8, :scale => 2
      t.string :front_deraileur_type
      t.string :strap
      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
