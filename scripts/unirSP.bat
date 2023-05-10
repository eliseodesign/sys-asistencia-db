@echo off
setlocal enabledelayedexpansion

rem Definir ruta base de los archivos
set "basepath=%cd%\procedures"

rem Crear archivo SQL de salida
type nul > "%cd%\procedures.sql"

rem Recorrer cada carpeta en el directorio base
for /d %%f in ("%basepath%\*") do (
    rem Recorrer cada archivo SQL dentro de la carpeta
    for %%g in ("%%f\*.sql") do (
        rem Leer el contenido del archivo y agregarlo al archivo SQL de salida
        type "%%g" >> "%cd%\procedures.sql"
        rem Separar con una línea en blanco
        echo. >> "%cd%\procedures.sql"
    )
)

rem Informar que la ejecución ha terminado
echo "Todos los archivos han sido combinados en procedures.sql"

pause
