-- Agregar columna año_publicacion
ALTER TABLE libros ADD COLUMN año_publicacion INT;

-- Agregar columna precio
ALTER TABLE libros ADD COLUMN precio DECIMAL(10,2);

-- Agregar columna genero
ALTER TABLE libros ADD COLUMN genero VARCHAR(100);

-- Modificar tipo de columna (ejemplo)
ALTER TABLE libros MODIFY COLUMN precio DECIMAL(12,2);

-- Eliminar columna
ALTER TABLE libros DROP COLUMN genero;



-- 1) Corregir el nombre de la autora
UPDATE libros
SET autor = 'Isabel M. Allende'
WHERE autor LIKE 'Isabel%Allende' OR autor = 'Isabel Allende';

-- 2) Eliminar libro(s) de J.K. Rowling (ejemplo)
DELETE FROM libros
WHERE autor = 'J.K. Rowling';

-- 3) Agregar columna año_publicacion
ALTER TABLE libros ADD COLUMN año_publicacion INT;

-- 4) Agregar columna precio
ALTER TABLE libros ADD COLUMN precio DECIMAL(10,2);

-- 5) Actualizar el año de 'Cien años de soledad' a 1967
UPDATE libros
SET año_publicacion = 1967
WHERE titulo = 'Cien años de soledad';

-- 6) Colocar "GABO - " antes del nombre de Gabriel García Márquez
UPDATE libros
SET autor = CONCAT('GABO - ', autor)
WHERE autor LIKE 'Gabriel García Márquez%';

-- 7) Agregar columna genero (si no existe)
ALTER TABLE libros ADD COLUMN genero VARCHAR(100);

-- 8) Asignar géneros a los libros ya almacenados (ejemplos)
UPDATE libros SET genero = 'Realismo mágico' WHERE titulo = 'Cien años de soledad';
UPDATE libros SET genero = 'Novela histórica' WHERE titulo LIKE '%Historia%';
-- y así sucesivamente para cada registro
