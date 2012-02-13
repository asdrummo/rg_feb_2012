# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120213084408) do

  create_table "accessories", :force => true do |t|
    t.string   "product_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "size"
    t.string   "color"
    t.string   "client_id"
    t.string   "image_path",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "builds", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_packages", :force => true do |t|
    t.string   "product_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",                  :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "frame_model_id"
    t.integer  "seat_post_id"
    t.integer  "seat_clamp_id"
    t.integer  "stem_id"
    t.integer  "handlebar_id"
    t.integer  "front_lever_id"
    t.integer  "fork_id"
    t.integer  "headset_id"
    t.integer  "spacers_id"
    t.integer  "front_wheel_id"
    t.integer  "rim_strip_id"
    t.integer  "front_tire_id"
    t.integer  "front_tube_id"
    t.integer  "cog_id"
    t.integer  "bolt_id"
    t.integer  "coaster_break_strap_id"
    t.integer  "front_brake_id"
    t.integer  "bottom_bracket_id"
    t.integer  "crank_id"
    t.integer  "chainring_id"
    t.integer  "chain_id"
    t.integer  "half_link_id"
    t.integer  "grip_id"
    t.integer  "pedal_id"
    t.integer  "saddle_id"
    t.integer  "rear_lever_id"
    t.integer  "rear_wheel_id"
    t.integer  "rear_tire_id"
    t.integer  "rear_tube_id"
    t.integer  "front_shifter_id"
    t.integer  "rear_shifter_id"
    t.integer  "rear_brake_id"
    t.string   "client_id"
    t.string   "package_type"
    t.integer  "front_derailleur_id"
    t.integer  "rear_derailleur_id"
  end

  create_table "components", :force => true do |t|
    t.string   "client_id"
    t.string   "component_type"
    t.integer  "product_id"
    t.string   "sku"
    t.string   "name"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                      :precision => 8, :scale => 2
    t.decimal  "price",                     :precision => 8, :scale => 2
    t.decimal  "stem_clamp_diameter",       :precision => 8, :scale => 2
    t.decimal  "steer_tube_diameter",       :precision => 8, :scale => 2
    t.decimal  "steer_tube_inner_diameter", :precision => 8, :scale => 2
    t.decimal  "clamp_diameter",            :precision => 8, :scale => 2
    t.decimal  "tube",                      :precision => 8, :scale => 2
    t.decimal  "max_turn_size",             :precision => 8, :scale => 2
    t.decimal  "clamp_diameter_high",       :precision => 8, :scale => 2
    t.decimal  "clamp_diameter_low",        :precision => 8, :scale => 2
    t.string   "bar_type"
    t.string   "brake_type"
    t.string   "brake_pull"
    t.decimal  "head_tube_inner_diameter",  :precision => 8, :scale => 2
    t.decimal  "steer_tube_length",         :precision => 8, :scale => 2
    t.decimal  "crown_race_diameter",       :precision => 8, :scale => 2
    t.decimal  "tube_width",                :precision => 8, :scale => 2
    t.string   "size"
    t.decimal  "hub_width",                 :precision => 8, :scale => 2
    t.decimal  "rim_width",                 :precision => 8, :scale => 2
    t.string   "cog_spline_thread"
    t.decimal  "width",                     :precision => 8, :scale => 2
    t.decimal  "tire_max_size",             :precision => 8, :scale => 2
    t.string   "wheel_size"
    t.decimal  "wheel_rim_width",           :precision => 8, :scale => 2
    t.decimal  "tire_width",                :precision => 8, :scale => 2
    t.string   "tire_size"
    t.integer  "num_bolts"
    t.integer  "teeth"
    t.decimal  "chain_width",               :precision => 8, :scale => 2
    t.string   "rear_derailleur_type"
    t.string   "spline_thread_type"
    t.integer  "cog_number"
    t.string   "pull"
    t.decimal  "mount_high",                :precision => 8, :scale => 2
    t.decimal  "mount_low",                 :precision => 8, :scale => 2
    t.decimal  "tire_max_width",            :precision => 8, :scale => 2
    t.string   "threading"
    t.decimal  "spacing",                   :precision => 8, :scale => 2
    t.string   "bolt"
    t.string   "taper"
    t.decimal  "shell_width",               :precision => 8, :scale => 2
    t.decimal  "qfactor",                   :precision => 8, :scale => 2
    t.decimal  "bcd",                       :precision => 8, :scale => 2
    t.string   "front_derailleur_type"
    t.string   "strap"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "shifter_type"
    t.string   "compartment"
    t.string   "rear_derailleur_mount"
    t.string   "front_derailleur_mount"
    t.decimal  "weight",                    :precision => 5, :scale => 1
    t.string   "handlebar_type"
  end

  create_table "custom_frame_models", :force => true do |t|
    t.string   "name"
    t.integer  "gears"
    t.string   "rear_derailleur_mount"
    t.string   "front_derailleur_mount"
    t.decimal  "bottom_bracket_width",       :precision => 5, :scale => 2
    t.decimal  "bottom_bracket_shell_width", :precision => 5, :scale => 2
    t.string   "bottom_bracket_threading"
    t.decimal  "clearance",                  :precision => 5, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "username",                          :limit => 25
    t.string   "email",                             :limit => 100, :null => false
    t.string   "hashed_password",                   :limit => 40
    t.string   "salt",                              :limit => 40
    t.integer  "payment_processor_subscription_id"
  end

  create_table "frame_model_sizes", :force => true do |t|
    t.string   "name"
    t.decimal  "price",          :precision => 8, :scale => 2
    t.integer  "frame_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frame_models", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.decimal  "price",                      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "kit",                                                      :default => false
    t.integer  "options"
    t.string   "gears"
    t.string   "sizes"
    t.string   "client_id"
    t.string   "rear_derailleur_mount"
    t.string   "front_derailleur_mount"
    t.decimal  "bottom_bracket_width",       :precision => 5, :scale => 2
    t.integer  "bottom_bracket_shell_width"
    t.string   "bottom_bracket_threading"
    t.decimal  "clearance",                  :precision => 5, :scale => 2
    t.integer  "front_wheel_size"
    t.integer  "rear_wheel_size"
    t.string   "front_brake_type"
    t.string   "rear_brake_type"
    t.integer  "steer_tube_length"
    t.integer  "head_tube_inner_diameter"
    t.string   "front_brake_pull"
    t.string   "rear_brake_pull"
  end

  create_table "gears", :force => true do |t|
    t.string   "name"
    t.decimal  "price",                 :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_gears"
    t.string   "front_derailleur_type"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "workshop_id"
    t.integer  "quantity",              :limit => 8
    t.decimal  "price",                              :precision => 10, :scale => 2
    t.decimal  "decimal",                            :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "frame_model_id"
    t.integer  "component_id"
    t.integer  "component_package_id"
    t.integer  "accessory_id"
    t.integer  "frame_model_size_id"
    t.integer  "gear_id"
    t.integer  "top_tube_style_id"
    t.string   "component_name"
    t.string   "client_id"
    t.string   "status"
    t.string   "tracking"
    t.integer  "option"
    t.integer  "custom_frame_model_id"
  end

  create_table "options", :force => true do |t|
    t.integer "accessory_id"
    t.string  "size"
    t.string  "color"
    t.integer "quantity"
    t.integer "component_id"
    t.integer "frame_model_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "invoice_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "status"
    t.integer  "shipping_id"
  end

  create_table "photos", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "bottom_bracket_id"
    t.integer  "front_brake_id"
    t.integer  "chainring_id"
    t.integer  "chain_id"
    t.integer  "cog_id"
    t.integer  "crank_id"
    t.integer  "fork_id"
    t.integer  "front_deraileur_id"
    t.integer  "front_lever_id"
    t.integer  "front_shifter_id"
    t.integer  "front_tire_id"
    t.integer  "front_tube_id"
    t.integer  "front_wheel_id"
    t.integer  "grip_id"
    t.integer  "half_link_id"
    t.integer  "handlebar_id"
    t.integer  "headset_id"
    t.integer  "pedal_id"
    t.integer  "rear_brake_id"
    t.integer  "rear_deraileur_id"
    t.integer  "rear_lever_id"
    t.integer  "rear_shifter_id"
    t.integer  "rear_tire_id"
    t.integer  "rear_tube_id"
    t.integer  "rear_wheel_id"
    t.integer  "rim_strip_id"
    t.integer  "saddle_id"
    t.integer  "seat_clamp_id"
    t.integer  "seat_post_id"
    t.integer  "stem_id"
    t.integer  "component_id"
    t.integer  "accessory_id"
    t.integer  "component_package_id"
    t.integer  "frame_model"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data",       :limit => 2147483647
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shipping_addresses", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  create_table "signups", :force => true do |t|
    t.string   "email",      :limit => 100, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "top_tube_styles", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "username",        :limit => 25
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_id"
    t.string   "privilege"
  end

  create_table "workshops", :force => true do |t|
    t.string   "client_id",  :limit => 3
    t.string   "experience"
    t.string   "location"
    t.datetime "start_date"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                   :precision => 8, :scale => 2
    t.datetime "end_date"
    t.string   "address"
  end

end
