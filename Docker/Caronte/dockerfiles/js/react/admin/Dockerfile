FROM eliel/nginx:base

# Instalar Node 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs build-essential

WORKDIR /var/www/app

# Copiamos el script complejo del PDF
COPY dockerfiles/js/react/admin/start.sh /usr/local/bin/start_react.sh
RUN chmod +x /usr/local/bin/start_react.sh

EXPOSE 3000 80 22
ENTRYPOINT ["/usr/local/bin/start_react.sh"]
