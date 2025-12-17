FROM eliel/ubuntu:base

RUN apt-get update && apt-get install -y nginx

# Permisos carpeta web
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Script de arranque propio
COPY dockerfiles/sweb/nginx/admin/start.sh /usr/local/bin/start_nginx.sh
RUN chmod +x /usr/local/bin/start_nginx.sh

EXPOSE 80 22
ENTRYPOINT ["/usr/local/bin/start_nginx.sh"]
