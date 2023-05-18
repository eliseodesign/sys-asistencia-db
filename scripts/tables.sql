CREATE DATABASE BDSysAsistencia
GO
USE BDSysAsistencia
GO

CREATE TABLE NumGrupo(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(7) Not Null
);

CREATE TABLE Anio(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(7) Not Null,
)

CREATE TABLE Carrera(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(50),
	Sigla Varchar(7) Not Null
);

CREATE TABLE Turno(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(12) Not Null
);

CREATE TABLE Grupo(
	Id Tinyint Not Null Primary Key Identity(1,1),
	EstudiantesMax TinyInt Not Null,
	DiasPresencial varchar(40) Not Null,
	-- FK's
	IdNumGrupo Tinyint Not Null Foreign Key References NumGrupo(Id),
	IdAnio Tinyint Not Null Foreign Key References Anio(Id),
	IdCarrera Tinyint Not Null Foreign Key References Carrera(Id),
	IdTurno Tinyint Not Null Foreign Key References Turno(Id)
);

CREATE TABLE Docente(
	Id Int Not Null Primary Key Identity(1,1),
	Nombre Varchar(20) Not Null, 
	Apellido Varchar(20) Not Null, 
	Dui char(9) Null,
	Cel char(9) Null,
	Huella Varbinary(Max) Not Null,
	IdCarrera Tinyint Not Null Foreign Key References Carrera(Id)
);

CREATE TABLE Estudiante(
	Id Int Not Null Primary Key Identity(1,1),
	Nombre Varchar(20) Not Null, 
	Apellido Varchar(20) Not Null, 
	Dui char(9) Null,
	Cel char(9) Null,
	Huella Varbinary(Max) Not Null,
	IdGrupo Tinyint Not Null Foreign Key References Grupo(Id)
);


CREATE TABLE Nomenclatura(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Letra char(1) Not Null,
	Descripcion varchar(20) Not Null,
);

CREATE TABLE Criterio(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre varchar(20) Not Null, --18
	Descripcion varchar(150) Not Null, --129
);

CREATE TABLE Asistencia(
	Id Int Not Null Primary Key Identity(1,1),
	IdEstudiante Int Not Null Foreign Key References Estudiante(Id),
	IdDocente Int Not Null Foreign Key References Docente(Id),
	IdCriterio Tinyint Not Null Foreign Key References Criterio(Id),
	IdNomenclatura Tinyint Not Null Foreign Key References Nomenclatura(Id),
	Observaciones varchar(50) Not Null,
	Fecha DateTime Not Null
	
);

CREATE TABLE GrupoDocente(
	Id int Not Null primary Key Identity(1,1),
	IdDocente Int Not Null Foreign Key References Docente(Id),
	IdGrupo Tinyint Not Null Foreign Key References Grupo(Id)
);