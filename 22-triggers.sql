USE metro_cdmx;

--Actulizar lineas del metro

CREATE TRIGGER update_updated_at_field
BEFORE UPDATE
ON `lines`
FOR EACH ROW
SET NEW.updated_at = NOW();

--Mostrar campo antes de ser editado 

SELECT * FROM `lines` WHERE id = 1;

--Editar y subir un nuevo dato ejemplo

UPDATE `lines` SET NAME = 'linea 28' WHERE id = 1;

--Podemos evitar los TRIGGERS utilixando TIMESTAMP al crear eñ campo 'updated_at'

ALETR TABLE `lines`
    MODIFY `updated_at` 
    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;