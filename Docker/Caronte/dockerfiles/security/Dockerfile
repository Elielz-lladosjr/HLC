FROM eliel/base
RUN apt-get update && apt-get install -y nmap net-tools ldap-utils iproute2 && rm -rf /var/lib/apt/lists/*
COPY dockerfiles/security/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]
