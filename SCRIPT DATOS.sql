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