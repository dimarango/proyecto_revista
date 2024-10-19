-- insertar registros de autores

SELECT * FROM autores;

INSERT INTO autores(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
(1286859586, 'Juan', 'García', 'López', '3005896352', 'juangarcialopez@gmail.com', '2024-06-24'),
(586859586, 'Mariana', 'Castaño', 'Acevedo', '3132259685', 'marianacastanoacevedo@hotmail.com', '2022-12-01');
GO

DELETE FROM autores WHERE id=1;

-- insertar registros de coautores
INSERT INTO coautores(numero_documento,autor_id, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
(1017587387, 1, 'Maria Camila', 'Higuita', 'Verano', '3053178481', 'mariahiguita@gmail.com', '2024-06-24'),
(2568887, 2, 'Ramón', 'Valentín', 'Catarán', '317854425', 'ramonvalentin@hotmail.com', '2022-12-01');
GO

-- insertar registros de manuscritos

INSERT INTO manuscritos (titulo_manuscrito, autor_id, tipo_manuscrito, idioma, fecha_recepcion)
VALUES ('Diseño de una una prueba para evaluar la safistacción laboral', 1, 'reflexión', 'español', '2023-05-20'),
('Determinantes de un buen clima laboral', 2, 'investigación', 'inglés', '2024-08-05');
GO

-- insertar registros tipos evaluadores

INSERT INTO evaluadores_editorial(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES('1126358963', 'Sara', 'Castro', 'Rendón', '3216398452', 'saracastro@hotmail.com', '2024-01-17'),
('15896475', 'Mauricio', 'Yepes', 'Ospina', '3045263923', 'mauricioyepes@hotmail.com', '2021-11-18');
GO

INSERT INTO evaluadores_tecnico(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES('5896365', 'Carlos', 'Marín', 'Zapata', 3205678542, 'carlosmarin@yahoo.es', '2020-01-20'),
('2596352', 'Camila', 'Salazar', 'Agudelo', 3102639863, 'camilasalazar@gmail.com', '2022-09-21');
GO

INSERT INTO evaluadores_pares(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES('698632', 'Sebastian', 'Matasanos', 'Zarama', 3158896523, 'sebastianmatasanos@gmail.com', '2023-06-19'),
('5896222', 'Carolina', 'Santamaría', 'Agudelo', 3002638863, 'carolinasantamaria@hotmail.com', '2022-09-29');
GO


-- insertar registros evaluadores
INSERT INTO evaluadores (persona_id,tipo_evaluador)

SELECT id AS 'persona_id','Evaluador editorial' AS 'tipo_evaluador'
FROM evaluadores_editorial
UNION
SELECT id AS 'persona_id','Evaluador técnico' AS 'tipo_evaluador'
FROM evaluadores_tecnico
UNION
SELECT id AS 'persona_id','Evaluador par' AS 'tipo_evaluador'
FROM evaluadores_pares;

SELECT * FROM evaluadores_editorial;
SELECT * FROM evaluadores;



-- insertar registros conceptos
INSERT INTO conceptos(concepto)
VALUES
('Rechazar'), 
('Pasar a revisión editorial'), 
('Pasar a pares'), 
('Aceptar con modificaciones menores'), 
('Aceptar con modificaciones mayores'), 
('Aceptar sin modificaciones'), 
('Aceptar para publicación');
GO

-- insertar registros evaluaciones
INSERT INTO evaluaciones (manuscrito_id, fecha_asignacion, fase_evaluacion, evaluador_id, fecha_concepto, concepto_id)
VALUES
(1, '2023-07-05', 'Revisión preliminar', 11, '2023-08-14', 1),
(2, '2024-08-15', 'Revisión pares', 33, '2023-08-29', 4);
GO



