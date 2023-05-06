/* 
	dd/MM/yyyy
	BDSysAsistenia
	1. Nombres y Apellidos
	2. Nombres y Apellidos
	3. Nombres y Apellidos
	4. Nombres y Apellidos 
*/

-- FASE 1: Crear base de datos

CREATE DATABASE BDSysAsistenia
USE BDSysAsistenia

-- FASE 2: Crear tablas de la base de datos.

-- Grupo
-- Campo Tipo   Null?    PK/FK       Autoincremento/Referencias
CREATE TABLE Grupo(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(7) Not Null,
);

CREATE TABLE Anio(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(7) Not Null,
)

CREATE TABLE GrupoAnio(
	Id Tinyint Not Null Primary Key Identity(1,1),
	IdGrupo Tinyint Not Null Foreign Key References Grupo(Id),
	IdAnio Tinyint Not Null Foreign Key References Anio(Id)
);

CREATE TABLE Turno(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(7) Not Null
);

CREATE TABLE Carrera(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Nombre Varchar(50),
	Siglas Varchar(7) Not Null
);

CREATE TABLE GrupoAnioCarrera(
	Id Tinyint Not Null Primary Key Identity(1,1),
	Codigo Varchar(10) Not Null,
	EstudiantesMax TinyInt Not Null,
	DiasPresencial bit Not Null,
	IdCarrera Tinyint Not Null Foreign Key References Carrera(Id),
	IdGrupoAnio Tinyint Not Null Foreign Key References GrupoAnio(Id)
);

CREATE TABLE Docente(
	Id Int Not Null Primary Key Identity(1,1),
	Nombre Varchar(20) Not Null, 
	Apellidos Varchar(20) Not Null, 
	Dui char(9) Null,
	Cel char(9) Null,
	Huella Varbinary(Max) Not Null,
	IdGrupo Tinyint Not Null Foreign Key References GrupoAnioCarrera(Id),
	IdCarrera Tinyint Not Null Foreign Key References Carrera(Id)
);

CREATE TABLE Estudiante(
	Id Int Not Null Primary Key Identity(1,1),
	Nombre Varchar(20) Not Null, 
	Apellidos Varchar(20) Not Null, 
	Dui char(9) Null,
	Cel char(9) Null,
	Huella Varbinary(Max) Not Null,
	IdGrupo Tinyint Not Null Foreign Key References GrupoAnioCarrera(Id)
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