@echo off

set /p servername="Ingrese el nombre del servidor: "
set /p username="Ingrese el nombre de usuario: "

sqlcmd -S %servername% -U %username% -i ./scripts/tables.sql

  for %%f in (./scripts/procedures/*.sql) do (
    echo "Ejecutando archivo %%f..."
    sqlcmd -S %servername% -U %username% -i "%%f"
  )

echo "Listo."
pause
