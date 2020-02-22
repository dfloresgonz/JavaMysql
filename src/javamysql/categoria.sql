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
INSERT INTO compras (2, 2, 1);
INSERT INTO compras (3, 1, 1);
INSERT INTO compras (3, 1, 2);
INSERT INTO compras (4, 3, 1);
INSERT INTO compras (10,4, 1);
INSERT INTO compras (4, 1, 3);
INSERT INTO compras (4, 2, 2);
INSERT INTO compras (10, 4, 2);
INSERT INTO compras (2, 4, 3);