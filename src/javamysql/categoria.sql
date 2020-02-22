DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS compras;
ALTER TABLE producto DROP IF EXISTS _id_categoria;
CREATE TABLE categoria(
    id_categoria INT,
    desc_categoria VARCHAR(30)
);

ALTER TABLE producto ADD COLUMN _id_categoria INT;
-- DELETE FROM categoria;
-- TRUNCATE TABLE categoria;
INSERT INTO categoria VALUES (1, 'Electronico');
INSERT INTO categoria VALUES (2, 'Domestico');
INSERT INTO categoria VALUES (3, 'Novedades');
INSERT INTO categoria VALUES (4, 'Importados');

UPDATE producto SET _id_categoria = 1 WHERE id_producto = 2;
UPDATE producto SET _id_categoria = 2 WHERE id_producto = 3;
UPDATE producto SET _id_categoria = 3 WHERE id_producto = 4;
UPDATE producto SET _id_categoria = 4 WHERE id_producto = 10;

CREATE TABLE cliente(
    id_cliente INT,
    nom_cliente VARCHAR(30)
);
INSERT INTO cliente VALUES (1, 'Ernesto');
INSERT INTO cliente VALUES (2, 'Edgar');
INSERT INTO cliente VALUES (3, 'Victor');
INSERT INTO cliente VALUES (4, 'Kelly');
CREATE TABLE compras(
    _id_producto INT,
    _id_cliente  INT,
    correlativo  INT
);
INSERT INTO compras VALUES (2, 2, 1);
INSERT INTO compras VALUES (3, 1, 1);
INSERT INTO compras VALUES (3, 1, 2);
INSERT INTO compras VALUES (4, 3, 1);
INSERT INTO compras VALUES (10,4, 1);
INSERT INTO compras VALUES (4, 1, 3);
INSERT INTO compras VALUES (4, 2, 2);
INSERT INTO compras VALUES (10, 4, 2);
INSERT INTO compras VALUES (2, 4, 3);
/*
1. CREAR UNA FUNCION QUE MUESTRE EL HISTORICO DE
   COMPRA DE CADA CLIENTE
   CLIENTE | PRODUCTO | MONTO COMPRADO

2. FUNCION QUE MUESTRE EL MONTO TOTAL COMPRADO POR
   CADA CLIENTE ORDENANDOLO DE MAYOR A MENOR
   CLIENTE | MONTO COMPRADO

3. MOSTRAR LOS PRODUCTOS MAS COMPRADOS MAYORES A 
   3500 SOLES DE COMPRA
   PRODUCTO | MONTO COMPRADO
*/