CREATE DATABASE gestion_editorial;
GO

USE gestion_editorial;
GO

-- Crear autores
CREATE TABLE autores (
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(15) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
celular VARCHAR(15) NOT NULL,
email VARCHAR(255) NOT NULL,
fecha_registro DATE NOT NULL,
);
GO

-- Crear coautores
CREATE TABLE coautores (
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(15) UNIQUE NOT NULL,
autor_id INT NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
celular VARCHAR(15) NOT NULL,
email VARCHAR(255) NOT NULL,
fecha_registro DATE NOT NULL,
CONSTRAINT fk_autores_coautores FOREIGN KEY (autor_id) REFERENCES autores(id)
);
GO

-- Crear manuscritos
CREATE TABLE manuscritos (
id INT PRIMARY KEY IDENTITY(1,1),
titulo_manuscrito VARCHAR(200) UNIQUE NOT NULL,
autor_id INT NOT NULL,
tipo_manuscrito VARCHAR(20) NOT NULL,
idioma VARCHAR(20) NOT NULL,
fecha_recepcion DATE,
CONSTRAINT fk_manuscritos_autores FOREIGN KEY (autor_id) REFERENCES autores(id)
);
GO

-- Crear evaluadores
CREATE TABLE evaluadores (
id INT PRIMARY KEY IDENTITY(1,1),
persona_id INT NOT NULL,
tipo_evaluador VARCHAR(100) NOT NULL,
fecha_registro DATE NOT NULL
);
GO

-- Crear conceptos
CREATE TABLE conceptos (
id INT PRIMARY KEY IDENTITY(1,1),
concepto varchar(150)
);
GO

-- Crear evaluaciones
CREATE TABLE evaluaciones (
id INT PRIMARY KEY IDENTITY(1,1),
manuscrito_id INT NOT NULL,
fecha_asignacion DATE NOT NULL,
fase_evaluacion VARCHAR(20),
evaluador_id INT NOT NULL,
fecha_concepto VARCHAR(20) NOT NULL,
concepto_id INT NOT NULL,
CONSTRAINT fk_manuscritos_evaluaciones FOREIGN KEY (manuscrito_id) REFERENCES manuscritos(id),
CONSTRAINT fk_evaluadores_evaluaciones FOREIGN KEY (evaluador_id) REFERENCES evaluadores(id),
CONSTRAINT fk_conceptos_evaluaciones FOREIGN KEY (concepto_id) REFERENCES conceptos(id)
);
GO

-- Crear comité técnico
CREATE TABLE evaluadores_tecnico(
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(15) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
celular VARCHAR(15) NOT NULL,
email VARCHAR(255) NOT NULL,
fecha_registro DATE NOT NULL
);
GO

-- Crear comité editorial
CREATE TABLE evaluadores_editorial(
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(15) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
celular VARCHAR(15) NOT NULL,
email VARCHAR(255) NOT NULL,
fecha_registro DATE NOT NULL
);
GO

-- Crear pares evaluadores
CREATE TABLE evaluadores_pares(
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(15) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
celular VARCHAR(15) NOT NULL,
email VARCHAR(255) NOT NULL,
fecha_registro DATE NOT NULL
);
GO