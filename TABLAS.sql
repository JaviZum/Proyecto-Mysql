CREATE DATABASE universidad;
USE universidad;

-- CREACION DE TABLAS

CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Profesores (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesores(profesor_id)
);

CREATE TABLE Calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    curso_id INT,
    calificacion DECIMAL(3,2),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- SCRIPTS DE DATOS ESTUDIANTES, PROFESORES, CURSOS Y NOTAS

INSERT INTO Estudiantes (nombre, email) VALUES 
('Aitor', 'aitor@gmail.com'),
('Iker', 'iker@gmail.com'),
('Maite', 'maite@gmail.com'),
('Eneko', 'eneko@gmail.com'),
('Arantxa', 'arantxa@gmail.com'),
('Unai', 'unai@gmail.com'),
('Leire', 'leire@gmail.com'),
('Miren', 'miren@gmail.com'),
('Jokin', 'jokin@gmail.com'),
('Amaia', 'amaia@gmail.com');

INSERT INTO Profesores (nombre, email) VALUES 
('Kepa', 'kepa@gmail.com'),
('Andoni', 'andoni@gmail.com'),
('Nerea', 'nerea@gmail.com'),
('Ane', 'ane@gmail.com'),
('Jon', 'jon@gmail.com');

INSERT INTO Cursos (nombre, profesor_id) VALUES 
('Matemáticas', 1),
('Física', 2),
('Química', 3),
('Historia', 4),
('Biología', 5),
('Literatura', 1),
('Inglés', 2),
('Informática', 3),
('Geografía', 4),
('Filosofía', 5);

INSERT INTO Calificaciones (estudiante_id, curso_id, calificacion) VALUES 
(1, 1, 8.5),
(2, 1, 7.3),
(3, 1, 9.0),
(4, 1, 6.7),
(5, 2, 8.9),
(6, 2, 7.5),
(7, 2, 9.2),
(8, 3, 7.0),
(9, 3, 6.9),
(10, 4, 8.2),
(1, 5, 9.1),
(2, 5, 7.7),
(3, 6, 8.5),
(4, 6, 6.3),
(5, 7, 9.7),
(6, 7, 7.8),
(7, 8, 8.9),
(8, 9, 7.0),
(9, 9, 9.2),
(10, 10, 6.4);

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



