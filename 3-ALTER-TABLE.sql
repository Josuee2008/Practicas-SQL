Use metro_cdmx
ALTER TABLE `stations`
MODIFY `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (id);
-- (Añade una llsve foreana)ADD CONSTRAINT `trains_line_id_foreign` 
--FOREING KEY (`line_id`) REFERENCE `lines` (`id`);