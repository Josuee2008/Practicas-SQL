Get-Content 2-create-database.sql | mysql -u user.example -p --database=database_name_ex;
USE metro_cdmx;

CREATE TABLE `lines`

(`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

`name` VARCHAR(10) NOT NULL,
`color` VARCHAR(15) NOT NULL,

`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(id)
)

DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trains`
(`serial_number` VARCHAR(10) NOT NULL,

`line_id`BIGINT(20) UNSIGNED NOT NULL,
`type` TINYINT(4) NOT NULL,
`year` INT(4) NOT NULL,

`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(serial_number)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `stations`
(`id`BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

`name` VARCHAR(50) NOT NULL,

`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
-----------
-- Creación de la tabla de random para un el reto de la clase de DELETE
CREATE TABLE `stations_delete` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(50) NOT NULL,
    `icon` VARCHAR(100) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;