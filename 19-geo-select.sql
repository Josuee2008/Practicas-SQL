 USE metro_cdmx;

-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) AS distance;


-- Calculamos en kilometros (solo lo divideimos entre 1000) con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;

--Usando consultas anidadas para sacar la longuitud y latitud de las estaciones
SELECT
ST_Distance_Sphere(
  (
    SELECT `location`
    FROM `locations`
    WHERE `station_id` = (
      SELECT `id`
      FROM `stations`
      WHERE `name` = "Pino Suarez"
    )
  ),
  (
    SELECT `location`
    FROM `locations`
    WHERE `station_id` = (
      SELECT `id`
      FROM `stations`
      WHERE `name` = "Balderas"
    )
  )
) AS distance_by_name;}

--Otro codigo usando INNER JOIN
-- Calculamos en kilometros con consultas anidadas
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Balderas"
    ),
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Pino Suarez"
    )
) / 1000 AS distance;

--Otra manera de hacer consultas anidadas sin unsar INNER JOIN 
SELECT ROUND(
        ST_Distance_Sphere(
            (
                SELECT `locations`.`location`
                FROM `locations`
                WHERE
                    `locations`.`station_id` = (
                        SELECT `station`.`id`
                        FROM `station`
                        WHERE
                            `station`.`name` = "Barranca del Muerto"
                    )
            ), (
                SELECT `locations`.`location`
                FROM `locations`
                WHERE
                    `locations`.`station_id` = (
                        SELECT `station`.`id`
                        FROM `station`
                        WHERE
                            `station`.`name` = "Viveros"
                    )
            )
        ) / 1000, 2
    ) AS distance;
    
    --Codigo más corto y efectivo 
SELECT `locations`.`location`
FROM `locations`
WHERE `locations`.`station_id`=(
    SELECT id FROM `stations` WHERE `name`="colegio militar"
);