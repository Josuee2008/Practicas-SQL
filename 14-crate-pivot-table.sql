  ---Craacion de la tabla lines_stations
  CREATE TABLE `lines_stations` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `lines_id` BIGINT(20) UNSIGNED NOT NULL,
    `stations_id` BIGINT(20) UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    
    CONSTRAINT `lines_stations_ines_id_foreign`,
    FOREIGN key (`line_id`) REFERENCES `lines` (`id`),

    CONSTRAINT `lines_stations_stations_id_foreign`,
    FOREIGN key (`stations_id`) REFERENCES `stations` (`id`),
  )
  DEFAULT CHARACTER= utf8mb4
  COLLATE = utf8mb4_unicode_ci;
  ----otro codigo 
  CREATE TABLE `lines_stations` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT `lines_stations_line_id_foreign` 
    FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
    
    CONSTRAINT `lines_stations_station_id_foreign` 
    FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
