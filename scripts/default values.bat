@echo off
chcp 65001
REM Variables de conexión
set /p server= "Servidor: "
set database=BDSysAsistencia
set /p username="Nombre de Usuario: "
set /p password="Contraseña: "

REM Consultas SQL
set sp_anio=SPCreateAnio
set sp_turno=SPCreateTurno
set sp_carrera=SPCreateCarrera

REM Valores para insertar
set vals_anio=1 2 3
set vals_turno=Matutino Vespertino Nocturno
setlocal enabledelayedexpansion
set vals_carrera[0]=Técnico en Ingeniería de Desarrollo de Software:TIDS
set vals_carrera[1]=Técnico en Ingeniería Eléctrica:TIE

echo "Estableciendo conexión con el servidor %server%..."
REM Establecer la conexión a SQL Server y ejecutar consultas SQL
echo "Insertando Años..."
for %%v in (%vals_anio%) do (
    sqlcmd -S %server% -U %username% -P %password% -d %database% -Q "EXEC %sp_anio% '%%v'"
)
echo "Años insertados"

echo "Insertando Carreras..."
for /L %%i in (0,1,1) do (
    for /F "tokens=1,2 delims=:" %%a in ("!vals_carrera[%%i]!") do (
        sqlcmd -S %server% -U %username% -P %password% -d %database% -Q "EXEC %sp_carrera% '%%a', '%%b'"
    )
)

echo "Carreras insertadas"

echo "Insertando Turnos..."
for %%v in (%vals_turno%) do (
    sqlcmd -S %server% -U %username% -P %password% -d %database% -Q "EXEC %sp_turno% '%%v'"
)
echo "Turnos insertados"

echo "Proceso completado."

pause