#!/bin/bash

# --- 1. FUNCIÓN DE AUDITORÍA (Lo que sale en tu foto) ---
elielload_ciber(){
    # Definimos directorio y archivo de logs según pide el examen
    LOG_DIR="/root/logs"
    mkdir -p "$LOG_DIR"
    
    # Si no hay variable CONTENEDOR, usamos el hostname
    NAME="${CONTENEDOR:-$HOSTNAME}"
    LOG_FILE="$LOG_DIR/${NAME}_ports"

    echo "=== PORT AUDITORIA ===" >> "$LOG_FILE"
    echo "Container: ${NAME}" >> "$LOG_FILE"
    echo "Timestamp: $(date)" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"

    echo "--- Listening TCP/UDP ports ---" >> "$LOG_FILE"
    # El comando exacto de la foto
    ss -tulnp >> "$LOG_FILE" 2>&1
    echo "" >> "$LOG_FILE"

    echo "--- Exposed environment ports ---" >> "$LOG_FILE"
    # El grep exacto de la foto
    printenv | grep -i port >> "$LOG_FILE" 2>/dev/null || true
    echo "" >> "$LOG_FILE"

    echo "=== END AUDITORIA ===" >> "$LOG_FILE"
}

# --- 2. BUCLE DE ESCANEO (Cada 30 seg) ---
elielscan(){
    while true; do
        elielload_ciber
        sleep 30
    done
}

# --- 3. FUNCIÓN MAIN (Arranque) ---
main() {
    # Arrancamos SSH (La "carga base")
    service ssh start

    # Lanzamos el escáner en segundo plano (&)
    elielscan &

    # Mantenemos el contenedor vivo
    tail -f /dev/null
}

# Ejecutamos el main
main