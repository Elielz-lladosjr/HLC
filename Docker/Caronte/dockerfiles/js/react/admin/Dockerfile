# Heredamos de Nginx
FROM eliel/ubnginx

# 1. Instalar Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs build-essential

# 2. Carpeta de trabajo para el código fuente
WORKDIR /var/www/app

# 3. Script Maestro (Build + Deploy + Dev)
COPY dockerfiles/js/react/admin/start.sh /usr/local/bin/start_react.sh
RUN chmod +x /usr/local/bin/start_react.sh

EXPOSE 3000 80 22
ENTRYPOINT ["/usr/local/bin/start_react.sh"]