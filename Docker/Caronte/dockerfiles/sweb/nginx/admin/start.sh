#!/bin/bash
# Auditoría heredada o nueva
( while true; do ss -tulnp >> /root/logs/auditoria_ports.log; sleep 30; done ) &

service ssh start
nginx -g 'daemon off;'
