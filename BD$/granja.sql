CREATE DATABASE IF NOT EXISTS granja_db;
USE granja_db;

CREATE TABLE razas (
  id_raza INT AUTO_INCREMENT PRIMARY KEY,
  nombre_raza VARCHAR(100) NOT NULL,
  descripcion_raza TEXT
);

CREATE TABLE alimentacion (
  id_alimentacion INT AUTO_INCREMENT PRIMARY KEY,
  tipo_alimento VARCHAR(50) NOT NULL,
  frecuencia VARCHAR(50),
  cantidad_diaria DECIMAL(6,2)
);

CREATE TABLE animales (
  id_animal INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  peso DECIMAL(7,2),
  fecha_nacimiento DATE,
  id_raza INT,
  id_alimentacion INT,
  FOREIGN KEY (id_raza) REFERENCES razas(id_raza),
  FOREIGN KEY (id_alimentacion) REFERENCES alimentacion(id_alimentacion)
);

-- Insertar razas
INSERT INTO razas (nombre_raza, descripcion_raza) VALUES
('Holstein', 'Raza lechera, origen Holanda.'),
('Hereford', 'Raza de carne, docil y apta para pastoreo.'),
('Angus', 'Raza de carne, gran conformación muscular.'),
('Brahman', 'Raza resistente al calor, origen India.'),
('Jersey', 'Raza lechera de menor tamaño, alta calidad de leche.'),
('Charolais', 'Raza de carne, origen Francia.'),
('Simental', 'Raza doble propósito leche/carne.'),
('Gyr', 'Raza resistente, eficiente en pasto.'),
('Limousin', 'Raza de carne, buena conversión alimenticia.'),
('Normando', 'Raza mixta, apta para leche y carne.');

-- Insertar alimentacion
INSERT INTO alimentacion (tipo_alimento, frecuencia, cantidad_diaria) VALUES
('Forraje', 'Diaria', 25.00),
('Concentrado', 'Diaria', 8.50),
('Mixto', 'Diaria', 18.00),
('Pastoreo', 'Diaria', 20.00),
('Suplem. proteico', 'Diaria', 2.00),
('Silaje', 'Diaria', 15.00),
('Heno', 'Diaria', 12.50),
('Leche (crías)', 'Diaria', 6.00),
('Concentrado alto energía', 'Diaria', 10.00),
('Balanceado', 'Diaria', 9.00);

-- Insertar animales
INSERT INTO animales (nombre, edad, peso, fecha_nacimiento, id_raza, id_alimentacion) VALUES
('Luna', 4, 420.00, '2021-05-12', 1, 1),
('ToroMax', 6, 580.50, '2019-11-02', 3, 2),
('Marta', 3, 390.00, '2022-08-22', 5, 3),
('Beto', 7, 610.00, '2018-02-14', 2, 4),
('Rosa', 2, 450.75, '2023-03-07', 1, 3),
('Goliath', 5, 540.20, '2020-12-01', 6, 2),
('Nina', 1, 320.00, '2024-01-10', 5, 8),
('Pampa', 8, 470.00, '2016-07-19', 7, 6),
('Zorro', 4, 599.99, '2021-09-30', 4, 2),
('Sol', 9, 700.00, '2015-04-04', 9, 4);

-- Consultas
-- 1. Animales entre 400 y 600 kg
SELECT * FROM animales WHERE peso BETWEEN 400 AND 600;

-- 2. Animales nacidos antes de 2024-01-01
SELECT * FROM animales WHERE fecha_nacimiento < '2024-01-01';

-- 3. Animal con id = 3
SELECT * FROM animales WHERE id_animal = 3;

-- 4. Número de razas
SELECT COUNT(*) AS total_razas FROM razas;

-- 5. Todas las razas
SELECT * FROM razas;

-- 6. Animal con raza y fecha nacimiento
SELECT a.id_animal, a.nombre AS nombre_animal, r.nombre_raza, a.fecha_nacimiento
FROM animales a
LEFT JOIN razas r ON a.id_raza = r.id_raza;