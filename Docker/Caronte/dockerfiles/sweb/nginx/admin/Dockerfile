# Heredamos de nuestra base
FROM eliel/ubbase

# 1. Instalar Nginx
RUN apt-get update && apt-get install -y nginx

# 2. Permisos para la carpeta web (Vital para que Node pueda escribir luego)
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# 3. Script de arranque de Nginx
COPY dockerfiles/sweb/nginx/admin/start.sh /usr/local/bin/start_nginx.sh
RUN chmod +x /usr/local/bin/start_nginx.sh

EXPOSE 80 22
ENTRYPOINT ["/usr/local/bin/start_nginx.sh"]