#!/bin/bash
# Replicamos la seguridad (Auditoría)
LOG_DIR="/root/logs"
mkdir -p $LOG_DIR
( while true; do ss -tulnp >> "$LOG_DIR/${CONTENEDOR}_ports"; sleep 30; done ) &

# Arrancamos servicios
service ssh start
# Nginx en primer plano para que no muera el contenedor si se usa solo
nginx -g 'daemon off;'