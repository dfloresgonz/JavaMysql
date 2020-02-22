CREATE TABLE categoria(
    id_categoria INT,
    desc_categoria VARCHAR(30)
);

ALTER TABLE producto ADD COLUMN _id_categoria INT;

INSERT INTO categoria VALUES (1, 'Electrónico');
INSERT INTO categoria VALUES (2, 'Doméstico');
INSERT INTO categoria VALUES (3, 'Novedades');
INSERT INTO categoria VALUES (4, 'Importados');

UPDATE producto SET _id_categoria = 1 WHERE id_producto = 2;
UPDATE producto SET _id_categoria = 2 WHERE id_producto = 3;
UPDATE producto SET _id_categoria = 3 WHERE id_producto = 4;
UPDATE producto SET _id_categoria = 4 WHERE id_producto = 10;