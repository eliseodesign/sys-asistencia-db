#!/bin/bash

# Solicitar al usuario el nombre del servidor, usuario y contraseña
read -p "Ingrese el nombre del servidor: " servername
read -p "Ingrese el nombre de usuario: " username
read -p "Ingrese la contraseña: " -s password

# Ejecutar el archivo de creación de la base de datos y las tablas
echo "Creando base de datos y tablas..."
/opt/mssql-tools/bin/sqlcmd -S $servername -U $username -P $password -i ./scripts/tables.sql

# Ejecutar cada archivo de procedimientos almacenados en la carpeta scripts/procedures
for file in ./scripts/procedures/*.sql
do
    echo "Ejecutando archivo $file..."
    /opt/mssql-tools/bin/sqlcmd -S $servername -U $username -P $password -i $file
done

echo "Listo."
