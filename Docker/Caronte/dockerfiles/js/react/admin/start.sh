#!/bin/bash

# 1. Ciberseguridad
LOG_DIR="/root/logs"
mkdir -p $LOG_DIR
( while true; do ss -tulnp >> "$LOG_DIR/${CONTENEDOR}_ports"; sleep 30; done ) &

cd /var/www/app

# 2. Instalar dependencias (si es la primera vez)
if [ ! -d "node_modules" ]; then
    echo "[INFO] Instalando dependencias (esto puede tardar)..."
    npm install
fi

# 3. PRODUCCIÓN: Generar Build y mover a Nginx
if [ ! -d "build" ] && [ ! -d "dist" ]; then
    echo "[INFO] Creando Build de producción..."
    npm run build
    
    echo "[INFO] Copiando a Nginx (/var/www/html)..."
    # Copia build o dist (dependiendo de la versión de react)
    cp -r build/* /var/www/html/ 2>/dev/null || cp -r dist/* /var/www/html/ 2>/dev/null
    chown -R www-data:www-data /var/www/html
fi

# 4. Arrancar SSH
service ssh start

# 5. Arrancar Nginx en SEGUNDO PLANO (Background)
# Usamos '&' para que no bloquee el script
nginx -g 'daemon off;' &

# 6. DESARROLLO: Arrancar Node en PRIMER PLANO
echo "[INFO] Arrancando entorno de Desarrollo..."
npm start