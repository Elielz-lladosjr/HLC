#!/bin/bash

# Heredamos la lógica de base lanzando su script si es necesario, o replicamos:
LOG_DIR="/root/logs"
mkdir -p $LOG_DIR
( while true; do ss -tulnp >> "$LOG_DIR/auditoria_ports.log"; sleep 30; done ) &

# Arrancar servicios
service ssh start
nginx -g 'daemon off;'
