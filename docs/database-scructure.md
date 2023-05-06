# Estructura de Sys-Asistencia-DB

## Grupo

| Campo    | Tipo        | Nulo | Clave  |
| -------- | ----------- | ---- | ------ |
| Id       | Tinyint     | No   | PK     |
| Nombre   | Varchar(7)  | No   |        |


## Anio

| Campo    | Tipo        | Nulo | Clave  |
| -------- | ----------- | ---- | ------ |
| Id       | Tinyint     | No   | PK     |
| Nombre   | Varchar(7)  | No   |        |


## GrupoAnio

| Campo    | Tipo        | Nulo | Clave  |
| -------- | ----------- | ---- | ------ |
| Id       | Tinyint     | No   | PK     |
| IdGrupo  | Tinyint     | No   | FK     |
| IdAnio   | Tinyint     | No   | FK     |


## Turno

| Campo    | Tipo        | Nulo | Clave  |
| -------- | ----------- | ---- | ------ |
| Id       | Tinyint     | No   | PK     |
| Nombre   | Varchar(7)  | No   |        |


## Carrera

| Campo    | Tipo        | Nulo | Clave  |
| -------- | ----------- | ---- | ------ |
| Id       | Tinyint     | No   | PK     |
| Nombre   | Varchar(50) | Si   |        |
| Siglas   | Varchar(7)  | No   |        |


## GrupoAnioCarrera

| Campo         | Tipo        | Nulo | Clave  |
| ------------- | ----------- | ---- | ------ |
| Id            | Tinyint     | No   | PK     |
| Codigo        | Varchar(10) | No   |        |
| EstudiantesMax| TinyInt     | No   |        |
| DiasPresencial| Bit         | No   |        |
| IdCarrera     | Tinyint     | No   | FK     |
| IdGrupoAnio   | Tinyint     | No   | FK     |


## Docente

| Campo        | Tipo            | Nulo | Clave  |
| ------------ | --------------- | ---- | ------ |
| Id           | Int             | No   | PK     |
| Nombre       | Varchar(20)     | No   |        |
| Apellidos    | Varchar(20)     | No   |        |
| Dui          | Char(9)         | Si   |        |
| Cel          | Char(9)         | Si   |        |
| Huella       | Varbinary(Max)  | No   |        |
| IdGrupo      | Tinyint         | No   | FK     |
| IdCarrera    | Tinyint         | No   | FK     |


## Estudiante
| Campo        | Tipo             | Nulo | Clave  |
|--------------|------------------|-------|--------|
| Id           | Int              | No    | PK     |
| Nombre       | Varchar(20)      | No    |        |
| Apellidos    | Varchar(20)      | No    |        |
| Dui          | Char(9)          | Sí    |        |
| Cel          | Char(9)          | Sí    |        |
| Huella       | Varbinary(Max)   | No    |        |
| IdGrupo      | Tinyint          | No    | FK     |

## Nomenclatura
| Campo        | Tipo             | Nulo | Clave  |
|--------------|------------------|-------|--------|
| Id           | Tinyint          | No    | PK     |
| Letra        | Char(1)          | No    |        |
| Descripcion  | Varchar(20)      | No    |        |

## Criterio
| Campo        | Tipo             | Nulo | Clave  |
|--------------|------------------|-------|--------|
| Id           | Tinyint          | No    | PK     |
| Nombre       | Varchar(20)      | No    |        |
| Descripcion  | Varchar(150)     | No    |        |

## Asistencia
| Campo        | Tipo             | Nulo | Clave  |
|--------------|------------------|-------|--------|
| Id           | Int              | No    | PK     |
| IdEstudiante | Int              | No    | FK     |
| IdDocente    | Int              | No    | FK     |
| IdCriterio   | Tinyint          | No    | FK     |
| IdNomenclatura | Tinyint        | No    | FK     |
| Observaciones | Varchar(50)     | No    |        |
| Fecha        | DateTime         | No    |        |