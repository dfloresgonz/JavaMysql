DELIMITER $$
DROP PROCEDURE IF EXISTS traer_data;
CREATE PROCEDURE traer_data(
    IN _p_precio1 NUMERIC(6, 2),
    IN _p_precio2 NUMERIC(6, 2)
)
LANGUAGE SQL MODIFIES SQL DATA
BEGIN
    START TRANSACTION;
    SELECT id_producto,
           desc_producto,
           precio AS precio_soles, -- alias
           precio / 3.5 AS precio_dolares
      FROM producto
     WHERE precio BETWEEN _p_precio1 AND _p_precio2
     ORDER BY precio DESC;
    COMMIT;
END$$
DELIMITER ;