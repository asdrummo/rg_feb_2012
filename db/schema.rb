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

ActiveRecord::Schema.define(:version => 20110821233516) do

  create_table "accessories", :force => true do |t|
    t.string   "product_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "size"
    t.string   "color"
    t.integer  "client_id"
    t.string   "image_path",                                :null => false
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
  end

  create_table "components_bottom_brackets", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "threading"
    t.integer  "num_bolts"
    t.decimal  "spacing",     :precision => 8, :scale => 2
    t.string   "bolt"
    t.string   "taper"
    t.decimal  "width",       :precision => 8, :scale => 2
    t.decimal  "shell_width", :precision => 8, :scale => 2
    t.decimal  "qfactor",     :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_chainrings", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                 :precision => 8, :scale => 2
    t.decimal  "price",                :precision => 8, :scale => 2
    t.decimal  "bcd",                  :precision => 8, :scale => 2
    t.integer  "num_bolts"
    t.integer  "teeth"
    t.decimal  "chain_width",          :precision => 8, :scale => 2
    t.string   "front_deraileur_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_chains", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.integer  "cog_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_cogs", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                :precision => 8, :scale => 2
    t.decimal  "price",               :precision => 8, :scale => 2
    t.integer  "num_bolts"
    t.integer  "teeth"
    t.decimal  "chain_width",         :precision => 8, :scale => 2
    t.string   "rear_deraileur_type"
    t.string   "spline_thread_type"
    t.integer  "cog_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_cranks", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                :precision => 8, :scale => 2
    t.decimal  "price",               :precision => 8, :scale => 2
    t.integer  "num_bolts"
    t.decimal  "bcd",                 :precision => 8, :scale => 2
    t.string   "taper"
    t.string   "front_deraleur_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_forks", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                  :precision => 8, :scale => 2
    t.decimal  "price",                 :precision => 8, :scale => 2
    t.string   "front_wheel_size"
    t.decimal  "rake",                  :precision => 8, :scale => 2
    t.decimal  "crown_diamter",         :precision => 8, :scale => 2
    t.decimal  "crown_to_hub",          :precision => 8, :scale => 2
    t.decimal  "max_tire_width",        :precision => 8, :scale => 2
    t.decimal  "max_tire_size",         :precision => 8, :scale => 2
    t.decimal  "front_hub_width",       :precision => 8, :scale => 2
    t.decimal  "steerer_tube_diameter", :precision => 8, :scale => 2
    t.decimal  "steerer_tube_length",   :precision => 8, :scale => 2
    t.string   "front_brake_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_front_brakes", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                 :precision => 8, :scale => 2
    t.decimal  "price",                :precision => 8, :scale => 2
    t.string   "pull"
    t.decimal  "mount_high",           :precision => 8, :scale => 2
    t.decimal  "mount_low",            :precision => 8, :scale => 2
    t.decimal  "front_tire_max_width", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_front_levers", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.decimal  "price",              :precision => 8, :scale => 2
    t.decimal  "clamp_diamter_high", :precision => 8, :scale => 2
    t.decimal  "clamp_diameter_low", :precision => 8, :scale => 2
    t.string   "bar_type"
    t.string   "front_brake_type"
    t.string   "front_brake_pull"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_front_tires", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                   :precision => 8, :scale => 2
    t.decimal  "price",                  :precision => 8, :scale => 2
    t.string   "size"
    t.decimal  "width",                  :precision => 8, :scale => 2
    t.decimal  "max_size",               :precision => 8, :scale => 2
    t.string   "front_wheel_size"
    t.decimal  "front_wheel_trim_width", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_front_tubes", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                   :precision => 8, :scale => 2
    t.decimal  "price",                  :precision => 8, :scale => 2
    t.string   "size"
    t.string   "front_wheel_size"
    t.decimal  "front_wheel_trim_width", :precision => 8, :scale => 2
    t.decimal  "front_tire_width",       :precision => 8, :scale => 2
    t.string   "front_tire_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_front_wheels", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",             :precision => 8, :scale => 2
    t.decimal  "price",            :precision => 8, :scale => 2
    t.decimal  "tube_width",       :precision => 8, :scale => 2
    t.string   "size"
    t.decimal  "trim_width",       :precision => 8, :scale => 2
    t.string   "front_brake_type"
    t.decimal  "hub_width",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_grips", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.decimal  "size",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_half_links", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_handlebars", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.decimal  "price",              :precision => 8, :scale => 2
    t.decimal  "clamp_diamter",      :precision => 8, :scale => 2
    t.decimal  "tube",               :precision => 8, :scale => 2
    t.string   "type"
    t.decimal  "stem_clamp_diamter", :precision => 8, :scale => 2
    t.decimal  "max_turn_size",      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_headsets", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                     :precision => 8, :scale => 2
    t.decimal  "price",                    :precision => 8, :scale => 2
    t.decimal  "head_tube_inner_diameter", :precision => 8, :scale => 2
    t.decimal  "steerer_tube_diameter",    :precision => 8, :scale => 2
    t.decimal  "crown_race_diameter",      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_pedals", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "strap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rear_brakes", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                 :precision => 8, :scale => 2
    t.decimal  "price",                :precision => 8, :scale => 2
    t.string   "pull"
    t.string   "type"
    t.decimal  "rear_tire_width_max",  :precision => 8, :scale => 2
    t.string   "rear_wheel_size"
    t.decimal  "rear_wheel_rim_width", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rear_levers", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.decimal  "price",              :precision => 8, :scale => 2
    t.decimal  "clamp_diamter_high", :precision => 8, :scale => 2
    t.decimal  "clamp_diameter_low", :precision => 8, :scale => 2
    t.string   "bar_type"
    t.string   "rear_brake_type"
    t.string   "rear_brake_pull"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rear_tires", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                  :precision => 8, :scale => 2
    t.decimal  "price",                 :precision => 8, :scale => 2
    t.string   "size"
    t.decimal  "width",                 :precision => 8, :scale => 2
    t.decimal  "max_size",              :precision => 8, :scale => 2
    t.string   "rear_wheel_size"
    t.decimal  "rear_wheel_trim_width", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rear_tubes", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                  :precision => 8, :scale => 2
    t.decimal  "price",                 :precision => 8, :scale => 2
    t.string   "size"
    t.string   "rear_wheel_size"
    t.decimal  "rear_wheel_trim_width", :precision => 8, :scale => 2
    t.decimal  "rear_tire_width",       :precision => 8, :scale => 2
    t.string   "rear_tire_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rear_wheels", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",              :precision => 8, :scale => 2
    t.decimal  "price",             :precision => 8, :scale => 2
    t.decimal  "hub_width",         :precision => 8, :scale => 2
    t.string   "size"
    t.decimal  "rim_width",         :precision => 8, :scale => 2
    t.string   "rear_brake_type"
    t.string   "cog_spline_thread"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_rim_strips", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_saddles", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_seat_clamps", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_seat_posts", :force => true do |t|
    t.integer  "client_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.integer  "product_id"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",        :precision => 10, :scale => 0
    t.decimal  "price",       :precision => 8,  :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_stems", :force => true do |t|
    t.integer  "client_id"
    t.string   "product_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.string   "vendor"
    t.string   "brand"
    t.string   "material"
    t.string   "color"
    t.string   "finish"
    t.decimal  "cost",                        :precision => 8, :scale => 2
    t.decimal  "price",                       :precision => 8, :scale => 2
    t.decimal  "stem_clamp_diameter",         :precision => 8, :scale => 2
    t.decimal  "steerer_tube_inner_diameter", :precision => 8, :scale => 2
    t.decimal  "steerer_tube_length",         :precision => 8, :scale => 2
    t.decimal  "stem_clamp_low",              :precision => 8, :scale => 2
    t.decimal  "stem_clamp_high",             :precision => 8, :scale => 2
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
    t.string   "username",        :limit => 25
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
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
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "kit",                                       :default => false
    t.integer  "options"
    t.string   "gears"
    t.string   "sizes"
  end

  create_table "gears", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "workshop_id"
    t.integer  "quantity",             :limit => 8
    t.decimal  "price",                             :precision => 10, :scale => 2
    t.decimal  "decimal",                           :precision => 10, :scale => 2
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
    t.integer  "bottom_bracket_id"
    t.string   "front_brake_id"
    t.string   "rear_brake_id"
    t.string   "chain_id"
    t.string   "chainring_id"
    t.string   "cog_id"
    t.string   "fork_id"
    t.string   "grip_id"
    t.string   "half_link_id"
    t.string   "handlebar_id"
    t.string   "headset_id"
    t.string   "front_lever_id"
    t.string   "rear_lever_id"
    t.string   "pedal_id"
    t.string   "rim_strip_id"
    t.string   "saddle_id"
    t.string   "seat_clamp_id"
    t.string   "seat_post_id"
    t.string   "front_shifter_id"
    t.string   "rear_shifter_id"
    t.string   "stem_id"
    t.string   "front_tire_id"
    t.string   "rear_tire_id"
    t.string   "front_tube_id"
    t.string   "rear_tube_id"
    t.string   "front_wheel_id"
    t.string   "rear_wheel_id"
    t.integer  "crank_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "invoice_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "status"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data",       :limit => 2147483647
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

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
