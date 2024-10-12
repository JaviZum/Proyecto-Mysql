-- CONSULTAS A REALIZAR EN LA BASE DE DATOS UNIVERSIDAD

-- CONSULTA NOTA MEDIA QUE OTORGA CADA PROFESOR
SELECT p.nombre AS profesor, AVG(c.calificacion) AS promedio_calificaciones
FROM Profesores p
JOIN Cursos cu ON p.profesor_id = cu.profesor_id
JOIN Calificaciones c ON cu.curso_id = c.curso_id
GROUP BY p.nombre;

-- CONSULTA NOTA MEDIA ESTUDIANTES
SELECT e.nombre AS estudiante, MAX(c.calificacion) AS mejor_calificacion
FROM Estudiantes e
JOIN Calificaciones c ON e.estudiante_id = c.estudiante_id
GROUP BY e.nombre;

-- CONSULTA ESTUDIANTES POR CURSOS INSCRITOS 
SELECT e.nombre AS estudiante, cu.nombre AS curso
FROM Estudiantes e
JOIN Calificaciones c ON e.estudiante_id = c.estudiante_id
JOIN Cursos cu ON c.curso_id = cu.curso_id
ORDER BY e.nombre, cu.nombre;

-- CONSULTA NOTAS MEDIAS CURSOS. LISTADOS DE MENOR A MAYOR NOTA
SELECT cu.nombre AS curso, AVG(c.calificacion) AS promedio_calificacion
FROM Cursos cu
JOIN Calificaciones c ON cu.curso_id = c.curso_id
GROUP BY cu.nombre
ORDER BY promedio_calificacion ASC;

-- CONSULTA MAYOR NUMERO DE CURSOS EN COMUN ESTUDIANTE PROFESOR
SELECT e.nombre AS estudiante, p.nombre AS profesor, COUNT(*) AS cursos_en_comun
FROM Estudiantes e
JOIN Calificaciones c ON e.estudiante_id = c.estudiante_id
JOIN Cursos cu ON c.curso_id = cu.curso_id
JOIN Profesores p ON cu.profesor_id = p.profesor_id
GROUP BY e.nombre, p.nombre
ORDER BY cursos_en_comun DESC
LIMIT 1;


