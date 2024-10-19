-- insertar registros en autores
SELECT * FROM autores;
INSERT INTO autores(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
(741896325, 'Daniel', 'Rodr�guez', 'Alonso', '3145896237', 'danielrodriguez@gmail.com', '2023-05-12'),
(963741258, 'Victoria', 'Herrera', 'Soto', '3162145987', 'victoriaherrera@yahoo.com', '2023-06-10'),
(852369741, 'Luc�a', 'Gonz�lez', 'Palacios', '3121459876', 'luciagonzalez@hotmail.com', '2023-07-04'),
(456123789, 'Andr�s', 'Pardo', 'Zapata', '3137896541', 'andrespardo@gmail.com', '2023-08-11'),
(789654321, 'Diego', 'Cruz', 'Ram�rez', '3174563214', 'diegocruz@gmail.com', '2023-09-15'),
(147852963, 'M�nica', 'Soto', 'Hern�ndez', '3145982365', 'monicasoto@hotmail.com', '2023-10-22'),
(951753456, 'Adri�n', 'Pe�a', 'Mu�oz', '3127896547', 'adrianpena@gmail.com', '2023-11-30'),
(753951456, 'Patricia', 'Mora', 'Duarte', '3152145987', 'patriciamora@gmail.com', '2024-01-08'),
(789456123, 'Sergio', 'Medina', 'Salas', '3187459621', 'sergiomedina@gmail.com', '2024-02-05'),
(852147963, 'Paola', 'Silva', 'P�rez', '3178965230', 'paolasilva@gmail.com', '2024-03-01');
GO

-- insertar registros en coautores
INSERT INTO coautores(numero_documento, autor_id, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
(963147852, 1, 'Gloria', 'Zapata', 'Pardo', '3117896542', 'gloriazapata@gmail.com', '2023-07-04'),
(789654789, 2, 'Juan Carlos', 'Alonso', 'Rodr�guez', '3154789652', 'juan.alonso@gmail.com', '2023-09-15'),
(654789123, 3, 'David', 'Casta�o', 'Gonz�lez', '3205896325', 'davidcastano@gmail.com', '2023-04-12'),
(951753852, 4, 'Clara', 'Vargas', 'L�pez', '3002145789', 'claravargas@yahoo.com', '2023-02-05'),
(789456852, 5, 'Jorge', 'Alvarez', 'Rend�n', '3134789521', 'jorgealvarez@gmail.com', '2023-06-11'),
(258963147, 6, 'Diana', 'Santos', 'Palacios', '3121459874', 'dianasantos@gmail.com', '2023-03-10'),
(147852369, 7, 'Alejandro', 'Mu�oz', 'Pe�a', '3168529741', 'alejandromunoz@hotmail.com', '2024-02-07'),
(963258741, 8, 'Natalia', 'Salas', 'Medina', '3147895263', 'nataliasalas@gmail.com', '2023-05-06'),
(741258963, 9, 'Marta', 'Duarte', 'Mora', '3007456213', 'martaduarte@gmail.com', '2024-01-25'),
(456789321, 10, 'Oscar', 'Ram�rez', 'Cruz', '3108963251', 'oscarramirez@hotmail.com', '2023-08-15');
GO

-- insertar registros en manuscritos
INSERT INTO manuscritos (titulo_manuscrito, autor_id, tipo_manuscrito, idioma, fecha_recepcion)
VALUES
('Ingenier�a Ambiental y Sostenibilidad', 1, 'investigaci�n', 'espa�ol', '2023-07-02'),
('Revoluci�n de la Industria 4.0', 2, 'reflexi�n', 'espa�ol', '2023-09-12'),
('Estudio sobre Energ�as Renovables', 3, 'reflexi�n', 'espa�ol', '2023-04-15'),
('Inteligencia Artificial: Nuevas Fronteras', 4, 'investigaci�n', 'ingl�s', '2023-02-05'),
('Impacto del Cambio Clim�tico en la Biodiversidad', 5, 'revisi�n', 'espa�ol', '2023-06-10'),
('El Futuro de la Rob�tica', 6, 'revisi�n', 'espa�ol', '2023-03-11'),
('Nuevas Tecnolog�as en el Siglo XXI', 7, 'reflexi�n', 'ingl�s', '2024-02-01'),
('Biotecnolog�a y Avances M�dicos', 8, 'investigaci�n', 'espa�ol', '2023-05-10'),
('Blockchain: Desaf�os y Oportunidades', 9, 'revisi�n', 'ingl�s', '2024-01-25'),
('Ciencias del Comportamiento en la Era Digital', 10, 'reflexi�n', 'espa�ol', '2023-08-10');
GO

-- insertar registros en evaluadores_tecnico
INSERT INTO evaluadores_tecnico(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
('5896365', 'Carlos', 'Mar�n', 'Zapata', 3205678542, 'carlosmarin@yahoo.es', '2020-01-20'),
('2596352', 'Camila', 'Salazar', 'Agudelo', 3102639863, 'camilasalazar@gmail.com', '2022-09-21'),
('741852963', 'David', 'P�rez', 'G�mez', 3127859625, 'davidperez@hotmail.com', '2023-04-11'),
('369852147', 'Ana', 'Morales', 'Vargas', 3145896321, 'anam@gmail.com', '2023-05-15'),
('753951456', 'Elena', 'R�os', 'Santos', 3004789652, 'elena@hotmail.com', '2023-06-02');

-- insertar registros en evaluadores_editorial
INSERT INTO evaluadores_editorial(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
('1126358963', 'Sara', 'Castro', 'Rend�n', '3216398452', 'saracastro@hotmail.com', '2024-01-17'),
('15896475', 'Mauricio', 'Yepes', 'Ospina', '3045263923', 'mauricioyepes@hotmail.com', '2021-11-18'),
('256987654', 'Laura', 'Mar�n', 'Casta�o', '3178965231', 'lauramarin@gmail.com', '2023-04-14'),
('357951456', 'Pablo', 'V�lez', 'L�pez', '3194561237', 'pablovelez@gmail.com', '2023-05-18'),
('963852741', 'Carmen', 'Garc�a', 'Mart�nez', '3114789635', 'carmengarcia@hotmail.com', '2023-06-05');
GO

-- insertar registros en evaluadores_pares
INSERT INTO evaluadores_pares(numero_documento, nombres, apellido_paterno, apellido_materno, celular, email, fecha_registro)
VALUES
('698632', 'Sebastian', 'Matasanos', 'Zarama', 3158896523, 'sebastianmatasanos@gmail.com', '2023-06-19'),
('5896222', 'Carolina', 'Santamar�a', 'Agudelo', 3002638863, 'carolinasantamaria@hotmail.com', '2022-09-29'),
('753951147', 'Alberto', 'Ortega', 'G�mez', 3114789521, 'albertoortega@hotmail.com', '2023-05-20'),
('963852147', 'Daniela', 'R�os', 'Santos', 3158965237, 'danielarios@gmail.com', '2023-06-10'),
('357159753', 'Mario', 'L�pez', 'Garc�a', 3147859632, 'mariolopez@yahoo.com', '2023-07-01');

SELECT * FROM evaluadores_tecnico;
SELECT * FROM evaluadores_editorial;
SELECT * FROM evaluadores_pares;
SELECT * FROM evaluadores;

-- insertar registros evaluadores
INSERT INTO evaluadores (persona_id,tipo_evaluador,fecha_registro)

SELECT id AS 'persona_id','Evaluador t�cnico' AS 'tipo_evaluador', fecha_registro AS 'fecha_registro'
FROM evaluadores_tecnico
UNION
SELECT id AS 'persona_id','Evaluador editorial' AS 'tipo_evaluador', fecha_registro AS 'fecha_registro'
FROM evaluadores_editorial
UNION
SELECT id AS 'persona_id','Evaluador par' AS 'tipo_evaluador', fecha_registro AS 'fecha_registro'
FROM evaluadores_pares;


-- insertar registros conceptos
INSERT INTO conceptos(concepto)
VALUES
('Rechazar'), 
('Pasar a revisi�n editorial'), 
('Pasar a pares'), 
('Aceptar con modificaciones menores'), 
('Aceptar con modificaciones mayores'), 
('Aceptar sin modificaciones'), 
('Aceptar para publicaci�n');
GO

-- insertar registros en evaluaciones
INSERT INTO evaluaciones (manuscrito_id, fecha_asignacion, fase_evaluacion, evaluador_id, fecha_concepto, concepto_id)
VALUES
(4, '2023-04-12', 'Revisi�n preliminar', 2, '2023-05-01', 3),
(3, '2023-04-15', 'Revisi�n preliminar', 1, '2023-05-02', 2),
(3, '2023-04-20', 'Revisi�n editorial', 7, '2023-05-10', 3),
(4, '2023-05-05', 'Revisi�n editorial', 9, '2023-06-01', 3),
(5, '2023-06-01', 'Revisi�n preliminar', 5, '2023-06-15', 2),
(2, '2023-06-06', 'Revisi�n preliminar', 3, '2023-06-25', 3),
(5, '2023-06-20', 'Revisi�n editorial', 10, '2023-07-10', 3),
(6, '2023-06-20', 'Revisi�n preliminar', 4, '2023-07-05', 3),
(2, '2023-06-30', 'Revisi�n editorial', 8, '2023-07-15', 3),
(1, '2023-07-05', 'Revisi�n preliminar', 4, '2023-08-14', 2),
(6, '2023-07-10', 'Revisi�n editorial', 7, '2023-07-25', 3),
(1, '2023-07-10', 'Revisi�n editorial', 9, '2023-08-20', 3),
(5, '2023-07-20', 'Revisi�n pares', 13, '2023-08-05', 4),
(2, '2023-07-20', 'Revisi�n pares', 11, '2023-08-15', 7),
(6, '2023-08-01', 'Revisi�n pares', 11, '2023-08-15', 6),
(1, '2023-08-25', 'Revisi�n pares', 12, '2023-09-05', 6),
(7, '2024-02-10', 'Revisi�n preliminar', 5, '2024-03-01', 2),
(7, '2024-03-10', 'Revisi�n editorial', 10, '2024-03-20', 3),
(7, '2024-04-01', 'Revisi�n pares', 15, '2024-04-15', 7);
GO

SELECT * FROM evaluaciones;

