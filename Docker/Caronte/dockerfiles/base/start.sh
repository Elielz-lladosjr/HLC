#!/bin/bash
LOG_DIR="/root/logs"
mkdir -p $LOG_DIR
LOG_FILE="$LOG_DIR/auditoria_ports.log"

(
    while true; do
        echo "--- AUDITORIA PORT $(date) ---" >> "$LOG_FILE"
        echo "Listening TCP/UDP ports:" >> "$LOG_FILE"
        ss -tulnp >> "$LOG_FILE" 2>&1
        echo "" >> "$LOG_FILE"
        sleep 30
    done
) &

exec "$@"
