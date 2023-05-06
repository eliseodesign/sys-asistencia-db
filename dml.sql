
-- FASE 3: Practica de comandos DML

-- Grupo
INSERT INTO Grupo (Nombre) VALUES ('Grupo1');
UPDATE Grupo SET Nombre = 'Grupo2' WHERE Id = 1;
DELETE FROM Grupo WHERE Id = 1;
SELECT * FROM Grupo;

-- Anio
INSERT INTO Anio (Nombre) VALUES ('Anio1');
UPDATE Anio SET Nombre = 'Anio2' WHERE Id = 1;
DELETE FROM Anio WHERE Id = 1;
SELECT * FROM Anio;

-- GrupoAnio
INSERT INTO GrupoAnio (IdGrupo, IdAnio) VALUES (1, 1);
UPDATE GrupoAnio SET IdGrupo = 2 WHERE Id = 1;
DELETE FROM GrupoAnio WHERE Id = 1;
SELECT * FROM GrupoAnio;

-- Turno
INSERT INTO Turno (Nombre) VALUES ('Turno1');
UPDATE Turno SET Nombre = 'Turno2' WHERE Id = 1;
DELETE FROM Turno WHERE Id = 1;
SELECT * FROM Turno;

-- Carrera
INSERT INTO Carrera (Nombre, Siglas) VALUES ('Carrera1', 'C1');
UPDATE Carrera SET Nombre = 'Carrera2' WHERE Id = 1;
DELETE FROM Carrera WHERE Id = 1;
SELECT * FROM Carrera;

-- GrupoAnioCarrera
INSERT INTO GrupoAnioCarrera (Codigo, EstudiantesMax, DiasPresencial, IdCarrera, IdGrupoAnio) VALUES ('GAC1', 30, 1, 1, 1);
UPDATE GrupoAnioCarrera SET Codigo = 'GAC2' WHERE Id = 1;
DELETE FROM GrupoAnioCarrera WHERE Id = 1;
SELECT * FROM GrupoAnioCarrera;

-- Docente
INSERT INTO Docente (Nombre, Apellidos, Dui, Cel, Huella, IdGrupo, IdCarrera) VALUES ('Docente1', 'Apellido1', '12345678-9', '77777777', 0x4D5A90000300000004000000FFFF0000, 1, 1);
UPDATE Docente SET Nombre = 'Docente2' WHERE Id = 1;
DELETE FROM Docente WHERE Id = 1;
SELECT * FROM Docente;




-- FASE 4: Creación de procedimientos almacenados



-- FASE 5: Agregar registros a todas las tablas de la base de datos



-- FASE 6: Creación de consultas SELECT con multi-tablas para reportes