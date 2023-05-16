-- NumGrupo
INSERT INTO NumGrupo (Nombre) VALUES ('Grupo 1');
UPDATE NumGrupo SET Nombre = 'Grupo 2' WHERE Id = 1;
DELETE FROM NumGrupo WHERE Id = 1;
SELECT * FROM NumGrupo;

-- Anio
INSERT INTO Anio (Nombre) VALUES ('1 año');
UPDATE Anio SET Nombre = '1° año' WHERE Id = 1;
DELETE FROM Anio WHERE Id = 1;
SELECT * FROM Anio;

-- Carrera
INSERT INTO Carrera (Nombre, Siglas) VALUES ('Software', 'TIDS');
UPDATE Carrera SET Nombre = 'Tec. en ing. de desarrollo de software', Siglas = 'TIDS' WHERE Id = 1;
DELETE FROM Carrera WHERE Id = 1;
SELECT * FROM Carrera;

-- Turno
INSERT INTO Turno (Nombre) VALUES ('Maña');
UPDATE Turno SET Nombre = 'Mañana' WHERE Id = 1;
DELETE FROM Turno WHERE Id = 1;
SELECT * FROM Turno;

-- Grupo
INSERT INTO Grupo (EstudiantesMax, DiasPresencial, IdNumGrupo, IdAnio, IdCarrera, IdTurno)
VALUES (30, 1, 1, 1, 1, 1);
UPDATE Grupo SET EstudiantesMax = 40, DiasPresencial = 0 WHERE Id = 1;
DELETE FROM Grupo WHERE Id = 1;
SELECT * FROM Grupo;

-- Docente
INSERT INTO Docente (Nombre, Apellidos, Dui, Cel, Huella, IdGrupo, IdCarrera)
VALUES ('Helen', 'Bolaños', '12345678-9', '71234567', 0x0, 1, 1);
UPDATE Docente SET Nombre = 'Docente2', Apellidos = 'Apellido2' WHERE Id = 1;
DELETE FROM Docente WHERE Id = 1;
SELECT * FROM Docente;

-- Estudiante
INSERT INTO Estudiante (Nombre, Apellidos, Dui, Cel, Huella, IdGrupo)
VALUES ('Eliseo', 'Arevalo', '12345678-9', '71234567', 0x0, 1);
UPDATE Estudiante SET Nombre = 'Estudiante2', Apellidos = 'Apellido2' WHERE Id = 1;
DELETE FROM Estudiante WHERE Id = 1;
SELECT * FROM Estudiante;

-- Nomenclatura
INSERT INTO Nomenclatura (Letra, Descripcion) VALUES ('T', 'Se Presento tarde');
UPDATE Nomenclatura SET Descripcion = 'Entro tarde en clases' WHERE Id = 1;
DELETE FROM Nomenclatura WHERE Id = 1;
SELECT * FROM Nomenclatura;

-- Criterio
INSERT INTO Criterio (Nombre, Descripcion) VALUES ('PRESENTE', 'Descripción Criterio1');
UPDATE Criterio SET Nombre = 'Criterio2', Descripcion = 'Descripción Criterio2' WHERE Id = 1;
DELETE FROM Criterio WHERE Id = 1;
SELECT * FROM Criterio;

-- Asistencia
INSERT INTO Asistencia (IdEstudiante, IdDocente, IdCriterio, IdNomenclatura, Observaciones, Fecha)
VALUES (1, 1, 1, 1, 'Observaciones Asistencia 1', GETDATE());
UPDATE Asistencia SET Observaciones = 'Observaciones Asistencia 2' WHERE Id = 1;
DELETE FROM Asistencia WHERE Id = 1;
SELECT * FROM Asistencia;

-- DocenteGrupo
INSERT INTO DocenteGrupo (IdDocente, IdGrupo)
VALUES (1, 1);
UPDATE DocenteGrupo SET IdGrupo = 2 WHERE Id = 1;
DELETE FROM DocenteGrupo WHERE Id = 1;
SELECT * FROM DocenteGrupo;