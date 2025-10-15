CREATE DATABASE IF NOT EXISTS consultorio_db;
USE consultorio_db;

-- Crear tabla de pacientes
CREATE TABLE pacientes (
  id_paciente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  identificacion VARCHAR(50) UNIQUE,
  fecha_nacimiento DATE,
  direccion VARCHAR(200),
  telefono VARCHAR(30)
);

-- Crear tabla de médicos
CREATE TABLE medicos (
  id_medico INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  direccion VARCHAR(200),
  especialidad VARCHAR(100),
  telefono VARCHAR(30)
);

-- Crear tabla de citas
CREATE TABLE citas (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_paciente INT NOT NULL,
  id_medico INT NOT NULL,
  fecha_hora DATETIME NOT NULL,
  motivo TEXT,
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);