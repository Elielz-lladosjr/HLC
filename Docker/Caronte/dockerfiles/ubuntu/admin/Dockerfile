FROM ubuntu:22.04
ARG TZ=Europe/Madrid
ENV USUARIO="eliel"

# Instalación de paquetería básica
RUN apt-get update && apt-get install -y \
    curl git nano iputils-ping openssh-server sudo net-tools iproute2 \
    && rm -rf /var/lib/apt/lists/*

#   Configuración SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh

# Copiamos la llave pública (Asegúrate de que existe en common/id_ed25519.pub)
COPY common/id_ed25519.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Copiamos el script de arranque
COPY dockerfiles/ubuntu/admin/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 22
ENTRYPOINT ["/usr/local/bin/start.sh"]