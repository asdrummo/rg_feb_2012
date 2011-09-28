CREATE TABLE `accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(8,2) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `component_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `frame_model_id` int(11) DEFAULT NULL,
  `seat_post_id` int(11) DEFAULT NULL,
  `seat_clamp_id` int(11) DEFAULT NULL,
  `stem_id` int(11) DEFAULT NULL,
  `handlebar_id` int(11) DEFAULT NULL,
  `front_lever_id` int(11) DEFAULT NULL,
  `fork_id` int(11) DEFAULT NULL,
  `headset_id` int(11) DEFAULT NULL,
  `spacers_id` int(11) DEFAULT NULL,
  `front_wheel_id` int(11) DEFAULT NULL,
  `rim_strip_id` int(11) DEFAULT NULL,
  `front_tire_id` int(11) DEFAULT NULL,
  `front_tube_id` int(11) DEFAULT NULL,
  `cog_id` int(11) DEFAULT NULL,
  `bolt_id` int(11) DEFAULT NULL,
  `coaster_break_strap_id` int(11) DEFAULT NULL,
  `front_brake_id` int(11) DEFAULT NULL,
  `bottom_bracket_id` int(11) DEFAULT NULL,
  `crank_id` int(11) DEFAULT NULL,
  `chainring_id` int(11) DEFAULT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `half_link_id` int(11) DEFAULT NULL,
  `grip_id` int(11) DEFAULT NULL,
  `pedal_id` int(11) DEFAULT NULL,
  `saddle_id` int(11) DEFAULT NULL,
  `rear_lever_id` int(11) DEFAULT NULL,
  `rear_wheel_id` int(11) DEFAULT NULL,
  `rear_tire_id` int(11) DEFAULT NULL,
  `rear_tube_id` int(11) DEFAULT NULL,
  `front_shifter_id` int(11) DEFAULT NULL,
  `rear_shifter_id` int(11) DEFAULT NULL,
  `rear_brake_id` int(11) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `finish` varchar(255) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `stem_clamp_diameter` decimal(8,2) DEFAULT NULL,
  `steer_tube_diameter` decimal(8,2) DEFAULT NULL,
  `steer_tube_inner_diameter` decimal(8,2) DEFAULT NULL,
  `stem_clamp_low` decimal(8,2) DEFAULT NULL,
  `stem_clamp_high` decimal(8,2) DEFAULT NULL,
  `clamp_diameter` decimal(8,2) DEFAULT NULL,
  `tube` decimal(8,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `max_turn_size` decimal(8,2) DEFAULT NULL,
  `clamp_diamter_high` decimal(8,2) DEFAULT NULL,
  `clamp_diameter_low` decimal(8,2) DEFAULT NULL,
  `bar_type` varchar(255) DEFAULT NULL,
  `rear_brake_type` varchar(255) DEFAULT NULL,
  `rear_brake_pull` varchar(255) DEFAULT NULL,
  `front_brake_type` varchar(255) DEFAULT NULL,
  `front_brake_pull` varchar(255) DEFAULT NULL,
  `head_tube_inner_diameter` decimal(8,2) DEFAULT NULL,
  `steerer_tube_diameter` decimal(8,2) DEFAULT NULL,
  `crown_race_diameter` decimal(8,2) DEFAULT NULL,
  `tube_width` decimal(8,2) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `hub_width` decimal(8,2) DEFAULT NULL,
  `rim_width` decimal(8,2) DEFAULT NULL,
  `cog_spline_thread` varchar(255) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `max_size` decimal(8,2) DEFAULT NULL,
  `front_wheel_size` varchar(255) DEFAULT NULL,
  `front_wheel_rim_width` decimal(8,2) DEFAULT NULL,
  `rear_wheel_size` varchar(255) DEFAULT NULL,
  `rear_wheel_rim_width` decimal(8,2) DEFAULT NULL,
  `front_tire_width` decimal(8,2) DEFAULT NULL,
  `front_tire_size` varchar(255) DEFAULT NULL,
  `num_bolts` int(11) DEFAULT NULL,
  `teeth` int(11) DEFAULT NULL,
  `chain_width` decimal(8,2) DEFAULT NULL,
  `rear_deraileur_type` varchar(255) DEFAULT NULL,
  `spline_thread_type` varchar(255) DEFAULT NULL,
  `cog_number` int(11) DEFAULT NULL,
  `pull` varchar(255) DEFAULT NULL,
  `mount_high` decimal(8,2) DEFAULT NULL,
  `mount_low` decimal(8,2) DEFAULT NULL,
  `front_tire_max_width` decimal(8,2) DEFAULT NULL,
  `threading` varchar(255) DEFAULT NULL,
  `spacing` decimal(8,2) DEFAULT NULL,
  `bolt` varchar(255) DEFAULT NULL,
  `taper` varchar(255) DEFAULT NULL,
  `shell_width` decimal(8,2) DEFAULT NULL,
  `qfactor` decimal(8,2) DEFAULT NULL,
  `bcd` decimal(8,2) DEFAULT NULL,
  `front_deraleur_type` varchar(255) DEFAULT NULL,
  `front_deraileur_type` varchar(255) DEFAULT NULL,
  `strap` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hashed_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `payment_processor_subscription_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

CREATE TABLE `frame_model_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `frame_model_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `frame_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image_path` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kit` tinyint(1) DEFAULT '0',
  `options` int(11) DEFAULT NULL,
  `gears` varchar(255) DEFAULT NULL,
  `sizes` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `gears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `workshop_id` int(11) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `decimal` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `frame_model_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `component_package_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `frame_model_size_id` int(11) DEFAULT NULL,
  `gear_id` int(11) DEFAULT NULL,
  `top_tube_style_id` int(11) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `option` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=latin1;

CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_id` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `frame_model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_file_name` varchar(255) DEFAULT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  `bottom_bracket_id` int(11) DEFAULT NULL,
  `front_brake_id` int(11) DEFAULT NULL,
  `chainring_id` int(11) DEFAULT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `cog_id` int(11) DEFAULT NULL,
  `crank_id` int(11) DEFAULT NULL,
  `fork_id` int(11) DEFAULT NULL,
  `front_deraileur_id` int(11) DEFAULT NULL,
  `front_lever_id` int(11) DEFAULT NULL,
  `front_shifter_id` int(11) DEFAULT NULL,
  `front_tire_id` int(11) DEFAULT NULL,
  `front_tube_id` int(11) DEFAULT NULL,
  `front_wheel_id` int(11) DEFAULT NULL,
  `grip_id` int(11) DEFAULT NULL,
  `half_link_id` int(11) DEFAULT NULL,
  `handlebar_id` int(11) DEFAULT NULL,
  `headset_id` int(11) DEFAULT NULL,
  `pedal_id` int(11) DEFAULT NULL,
  `rear_brake_id` int(11) DEFAULT NULL,
  `rear_deraileur_id` int(11) DEFAULT NULL,
  `rear_lever_id` int(11) DEFAULT NULL,
  `rear_shifter_id` int(11) DEFAULT NULL,
  `rear_tire_id` int(11) DEFAULT NULL,
  `rear_tube_id` int(11) DEFAULT NULL,
  `rear_wheel_id` int(11) DEFAULT NULL,
  `rim_strip_id` int(11) DEFAULT NULL,
  `saddle_id` int(11) DEFAULT NULL,
  `seat_clamp_id` int(11) DEFAULT NULL,
  `seat_post_id` int(11) DEFAULT NULL,
  `stem_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `component_package_id` int(11) DEFAULT NULL,
  `frame_model` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`),
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

CREATE TABLE `shipping_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `signups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

CREATE TABLE `top_tube_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hashed_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(3) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20110806175458');

INSERT INTO schema_migrations (version) VALUES ('20110806200336');

INSERT INTO schema_migrations (version) VALUES ('20110806200455');

INSERT INTO schema_migrations (version) VALUES ('20110806200547');

INSERT INTO schema_migrations (version) VALUES ('20110806202835');

INSERT INTO schema_migrations (version) VALUES ('20110806210227');

INSERT INTO schema_migrations (version) VALUES ('20110806214709');

INSERT INTO schema_migrations (version) VALUES ('20110806215352');

INSERT INTO schema_migrations (version) VALUES ('20110807180257');

INSERT INTO schema_migrations (version) VALUES ('20110807182653');

INSERT INTO schema_migrations (version) VALUES ('20110807212432');

INSERT INTO schema_migrations (version) VALUES ('20110808042731');

INSERT INTO schema_migrations (version) VALUES ('20110808054020');

INSERT INTO schema_migrations (version) VALUES ('20110808161854');

INSERT INTO schema_migrations (version) VALUES ('20110808210320');

INSERT INTO schema_migrations (version) VALUES ('20110808211635');

INSERT INTO schema_migrations (version) VALUES ('20110808215030');

INSERT INTO schema_migrations (version) VALUES ('20110808222500');

INSERT INTO schema_migrations (version) VALUES ('20110808223049');

INSERT INTO schema_migrations (version) VALUES ('20110809221132');

INSERT INTO schema_migrations (version) VALUES ('20110809232208');

INSERT INTO schema_migrations (version) VALUES ('20110810003756');

INSERT INTO schema_migrations (version) VALUES ('20110810064330');

INSERT INTO schema_migrations (version) VALUES ('20110811011104');

INSERT INTO schema_migrations (version) VALUES ('20110811012344');

INSERT INTO schema_migrations (version) VALUES ('20110811013005');

INSERT INTO schema_migrations (version) VALUES ('20110811021005');

INSERT INTO schema_migrations (version) VALUES ('20110811193549');

INSERT INTO schema_migrations (version) VALUES ('20110813024809');

INSERT INTO schema_migrations (version) VALUES ('20110813180340');

INSERT INTO schema_migrations (version) VALUES ('20110814192221');

INSERT INTO schema_migrations (version) VALUES ('20110814201706');

INSERT INTO schema_migrations (version) VALUES ('20110814203237');

INSERT INTO schema_migrations (version) VALUES ('20110814205606');

INSERT INTO schema_migrations (version) VALUES ('20110814210757');

INSERT INTO schema_migrations (version) VALUES ('20110814211438');

INSERT INTO schema_migrations (version) VALUES ('20110814215943');

INSERT INTO schema_migrations (version) VALUES ('20110814220425');

INSERT INTO schema_migrations (version) VALUES ('20110814221206');

INSERT INTO schema_migrations (version) VALUES ('20110814224420');

INSERT INTO schema_migrations (version) VALUES ('20110814225856');

INSERT INTO schema_migrations (version) VALUES ('20110814230332');

INSERT INTO schema_migrations (version) VALUES ('20110814230928');

INSERT INTO schema_migrations (version) VALUES ('20110814231500');

INSERT INTO schema_migrations (version) VALUES ('20110814231611');

INSERT INTO schema_migrations (version) VALUES ('20110814232940');

INSERT INTO schema_migrations (version) VALUES ('20110814232952');

INSERT INTO schema_migrations (version) VALUES ('20110814233808');

INSERT INTO schema_migrations (version) VALUES ('20110814234728');

INSERT INTO schema_migrations (version) VALUES ('20110814235148');

INSERT INTO schema_migrations (version) VALUES ('20110815001504');

INSERT INTO schema_migrations (version) VALUES ('20110815002103');

INSERT INTO schema_migrations (version) VALUES ('20110815002549');

INSERT INTO schema_migrations (version) VALUES ('20110815002853');

INSERT INTO schema_migrations (version) VALUES ('20110815004408');

INSERT INTO schema_migrations (version) VALUES ('20110815004709');

INSERT INTO schema_migrations (version) VALUES ('20110815004903');

INSERT INTO schema_migrations (version) VALUES ('20110815005245');

INSERT INTO schema_migrations (version) VALUES ('20110815024109');

INSERT INTO schema_migrations (version) VALUES ('20110815024534');

INSERT INTO schema_migrations (version) VALUES ('20110815041543');

INSERT INTO schema_migrations (version) VALUES ('20110815041718');

INSERT INTO schema_migrations (version) VALUES ('20110817194859');

INSERT INTO schema_migrations (version) VALUES ('20110818160624');

INSERT INTO schema_migrations (version) VALUES ('20110818163848');

INSERT INTO schema_migrations (version) VALUES ('20110819225811');

INSERT INTO schema_migrations (version) VALUES ('20110820010420');

INSERT INTO schema_migrations (version) VALUES ('20110820065543');

INSERT INTO schema_migrations (version) VALUES ('20110820070315');

INSERT INTO schema_migrations (version) VALUES ('20110820234659');

INSERT INTO schema_migrations (version) VALUES ('20110820235400');

INSERT INTO schema_migrations (version) VALUES ('20110821081438');

INSERT INTO schema_migrations (version) VALUES ('20110821084643');

INSERT INTO schema_migrations (version) VALUES ('20110821185615');

INSERT INTO schema_migrations (version) VALUES ('20110821215206');

INSERT INTO schema_migrations (version) VALUES ('20110821223908');

INSERT INTO schema_migrations (version) VALUES ('20110821233516');

INSERT INTO schema_migrations (version) VALUES ('20110825121247');

INSERT INTO schema_migrations (version) VALUES ('20110825121627');

INSERT INTO schema_migrations (version) VALUES ('20110825152428');

INSERT INTO schema_migrations (version) VALUES ('20110825155704');

INSERT INTO schema_migrations (version) VALUES ('20110903091046');

INSERT INTO schema_migrations (version) VALUES ('20110904011625');

INSERT INTO schema_migrations (version) VALUES ('20110904050036');

INSERT INTO schema_migrations (version) VALUES ('20110904050910');

INSERT INTO schema_migrations (version) VALUES ('20110905013004');

INSERT INTO schema_migrations (version) VALUES ('20110905020607');

INSERT INTO schema_migrations (version) VALUES ('20110905023812');

INSERT INTO schema_migrations (version) VALUES ('20110905071517');

INSERT INTO schema_migrations (version) VALUES ('20110906061953');

INSERT INTO schema_migrations (version) VALUES ('20110908114742');

INSERT INTO schema_migrations (version) VALUES ('20110910133053');

INSERT INTO schema_migrations (version) VALUES ('20110911122702');

INSERT INTO schema_migrations (version) VALUES ('20110913045603');

INSERT INTO schema_migrations (version) VALUES ('20110915082346');

INSERT INTO schema_migrations (version) VALUES ('20110920005728');

INSERT INTO schema_migrations (version) VALUES ('20110921111136');

INSERT INTO schema_migrations (version) VALUES ('20110924124009');

INSERT INTO schema_migrations (version) VALUES ('20110924124114');

INSERT INTO schema_migrations (version) VALUES ('20110928114212');