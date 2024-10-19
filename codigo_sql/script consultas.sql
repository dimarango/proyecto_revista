-- Consulta de manuscritos junto con el nombre del autor
SELECT 
	CONCAT(au.nombres,' ',au.apellido_paterno,' ',au.apellido_materno) AS 'Nombre del autor',
	titulo_manuscrito
FROM autores au
INNER JOIN manuscritos ma ON ma.autor_id = au.id;

-- Cantidad de evaluaciones en cada fase de evaluación
SELECT
	count(manuscrito_id) AS 'Cantidad de manuscritos',
	fase_evaluacion
FROM evaluaciones
GROUP BY fase_evaluacion;

-- Obtener los coautores de un autor específico
SELECT
	CONCAT(au.nombres,' ',au.apellido_paterno,' ',au.apellido_materno) AS 'Nombre del autor',
	CONCAT(co.nombres,' ',co.apellido_paterno,' ',co.apellido_materno) AS 'Nombre del coautor'
FROM autores au
INNER JOIN coautores co ON co.autor_id = au.id;

-- Consulta de manuscritos con sus evaluaciones y el concepto asociado
SELECT
	ma.id,
	titulo_manuscrito,
	fase_evaluacion,
	ct.concepto
FROM evaluaciones ev
INNER JOIN manuscritos ma ON ma.id = ev.manuscrito_id
INNER JOIN conceptos ct ON ct.id = ev.concepto_id 
ORDER BY titulo_manuscrito;

-- Autores que tienen manuscritos asignados a pares evaluadores
SELECT DISTINCT
	CONCAT(au.nombres,' ',au.apellido_paterno,' ',au.apellido_materno) AS 'Nombre del autor'
FROM autores au
JOIN manuscritos ma ON au.id = ma.autor_id
JOIN evaluaciones ev ON ma.id = ev.manuscrito_id
WHERE ev.fase_evaluacion = 'Revisión pares';


-- Obtener los manuscritos en Revisión pares que fueron aceptados con modificaciones menores o sin modificaciones
SELECT
	ma.id AS 'id manuscrito',
	ma.titulo_manuscrito,
	ev.fase_evaluacion,
	ct.concepto
FROM manuscritos ma
INNER JOIN evaluaciones ev ON ev.manuscrito_id = ma.id
INNER JOIN conceptos ct ON ct.id = ev.concepto_id
WHERE ma.id in (SELECT manuscrito_id FROM evaluaciones WHERE concepto_id in (4,6))
AND fase_evaluacion = 'Revisión pares';

-- Listado de autores con sus correspondientes manuscritos, a los que aún no se les ha asignado evaluación

SELECT 
	CONCAT(au.nombres,' ',au.apellido_paterno,' ',au.apellido_materno) AS 'Nombre del autor',
	ma.titulo_manuscrito
FROM autores au
LEFT JOIN manuscritos ma ON au.id = ma.autor_id
LEFT JOIN evaluaciones ev ON ma.id = ev.manuscrito_id
WHERE ev.id IS NULL;


-- Consulta de manuscritos con la última evaluación obtenida y el concepto asociado
SELECT 
    ma.id AS manuscrito_id,
    ma.titulo_manuscrito,
    ev.fase_evaluacion,
    ct.concepto,
    ev.fecha_concepto,
    ROW_NUMBER() OVER (PARTITION BY ma.id ORDER BY ev.fecha_concepto DESC) AS fila -- asigna una numeración, reiniciando el conteo por cada manuscrito
INTO #concepto_reciente -- crea tabla temporal
FROM evaluaciones ev
INNER JOIN manuscritos ma ON ma.id = ev.manuscrito_id
INNER JOIN conceptos ct ON ct.id = ev.concepto_id;

SELECT manuscrito_id, titulo_manuscrito, fase_evaluacion, concepto
FROM #concepto_reciente
WHERE fila = 1; -- solo se obtiene la evaluación más reciente

-- Crear una vista para obtener el estado de evaluación de los manuscritos
CREATE VIEW VW_MANUSCRITOS AS
SELECT 
    m.titulo_manuscrito AS Título,
    a.nombres + ' ' + a.apellido_paterno + ' ' + a.apellido_materno AS Autor,
    e.fase_evaluacion AS Fase,
    c.concepto AS Concepto,
    e.fecha_concepto AS FechaConcepto
FROM manuscritos m
JOIN autores a ON m.autor_id = a.id
JOIN evaluaciones e ON m.id = e.manuscrito_id
JOIN conceptos c ON e.concepto_id = c.id;


-- Consultar la vista creada
SELECT * FROM VW_MANUSCRITOS;

DROP VIEW VW_MANUSCRITOS;

-- Crear un procedimiento almacenado para registrar una evaluación
CREATE PROCEDURE sp_registrar_evaluacion
    @manuscrito_id INT,
    @fase_evaluacion VARCHAR(20),
    @evaluador_id INT,
    @fecha_asignacion DATE,
    @fecha_concepto DATE,
    @concepto_id INT
AS
BEGIN
    -- Insertar la evaluación en la tabla evaluaciones
    INSERT INTO evaluaciones (manuscrito_id, fase_evaluacion, evaluador_id, fecha_asignacion, fecha_concepto, concepto_id)
    VALUES (@manuscrito_id, @fase_evaluacion, @evaluador_id, @fecha_asignacion, @fecha_concepto, @concepto_id);

    -- Mensaje de confirmación
    PRINT 'Evaluación registrada correctamente';
END;

-- Ejecutar el procedimiento almacenado para registrar una evaluación
EXEC sp_registrar_evaluacion 
    @manuscrito_id = 3,
    @fase_evaluacion = 'Revisión pares',
    @evaluador_id = 14,
    @fecha_asignacion = '2023-07-05',
    @fecha_concepto = '2023-08-14',
    @concepto_id = 1;

SELECT * FROM evaluaciones;
