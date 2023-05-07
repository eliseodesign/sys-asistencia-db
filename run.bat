@echo off

set /p servername="Ingrese el nombre del servidor: "
set /p username="Ingrese el nombre de usuario: "
set /p password="Ingrese la contraseña: "

sqlcmd -S %servername% -U %username% -P %password% -i ./scripts/tables.sql

cd ./scripts/procedures

for /D %%d in (*) do (
    echo "Procedimientos en directorio: %%d"
    cd ./%%d
    for %%f in (*.sql) do (
        echo "Ejecutando %%f"
        sqlcmd -S %servername% -U %username% -P %password% -d BDSysAsistencia -i "%%f"
    )
    cd .. 
)



echo "Listo."
pause
