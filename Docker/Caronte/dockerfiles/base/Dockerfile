FROM ubuntu:22.04
ARG TZ=Europe/Madrid
ENV USUARIO="eliel"
RUN apt-get update && apt-get install -y curl git nano iputils-ping openssh-server sudo net-tools && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh
COPY common/id_ed25519.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
