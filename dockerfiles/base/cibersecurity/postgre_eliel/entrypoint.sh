#!/bin/bash

# 1. Iniciamos el motor de la base de datos en segundo plano
service postgresql start

# Esperamos un par de segundos para que arranque bien
sleep 3

# 2. Creamos la base de datos y el usuario con contraseña 
# Usaremos variables que luego le pasaremos desde el archivo de Helm
echo "Creando usuario y base de datos de Eliel..."
sudo -u postgres psql -c "CREATE USER ${DB_USER} WITH PASSWORD '${DB_PASSWORD}';"
sudo -u postgres psql -c "CREATE DATABASE ${DB_NAME} OWNER ${DB_USER};"

echo "¡Base de datos lista y securizada!"

# 3. Mantenemos el contenedor vivo mostrando los logs
tail -f /var/log/postgresql/postgresql-16-main.log