# a. Partiendo de la imagen de ciberseguridad (Herencia de capas)
FROM eliel/ubbase

# Instalar PostgreSQL manualmente como pide el profe
RUN apt-get update && apt-get install -y postgresql postgresql-contrib sudo \
    && rm -rf /var/lib/apt/lists/*

# Configurar Postgres para que acepte conexiones desde nuestro backend
RUN echo "listen_addresses='*'" >> /etc/postgresql/16/main/postgresql.conf
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/16/main/pg_hba.conf

# Copiar el script que creará el usuario y la base de datos
COPY dockerfiles/base/cibersecurity/postgre_eliel/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Exponer el puerto de la base de datos
EXPOSE 5432

# Ejecutar nuestro script al arrancar
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]