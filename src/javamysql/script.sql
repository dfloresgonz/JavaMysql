DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_producto;
CREATE PROCEDURE insertar_producto(
  IN  _p_nombre  VARCHAR(30),
  IN  _p_precio  NUMERIC(6,2),
  OUT _p_confirm INT
)
BEGIN
    DECLARE _v_id_prod INT;
    SET _p_nombre = UPPER(_p_nombre);
    SET _p_precio = _p_precio * 3.5;
    --
    SELECT FLOOR(1 + RAND() * 60) INTO _v_id_prod;
    --
    INSERT INTO producto
        (id_producto, desc_producto, precio)
        VALUES
        (_v_id_prod , _p_nombre    , _p_precio);
    --
    IF ROW_COUNT() > 0 THEN
        SET _p_confirm = 1;
    ELSE
        SET _p_confirm = 0;
    END IF;
END$$
DELIMITER ;