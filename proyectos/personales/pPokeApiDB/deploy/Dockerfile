# ETAPA 1: Construcción (Frontend)
FROM node:18 AS builder
WORKDIR /app
# Ruta desde la raíz del VPS
COPY proyectos/personales/pPokeApiFront/src/package*.json ./
RUN npm install
COPY proyectos/personales/pPokeApiFront/src/ ./
RUN npm run build

# ETAPA 2: Producción y Ciberseguridad (Lo que pide el profe)
FROM eliel/cibersecurity

# Instalamos Nginx
RUN apt-get update && apt-get install -y nginx apache2-utils \
    && rm -rf /var/lib/apt/lists/*

# Creamos tu usuario
RUN useradd -ms /bin/bash eliel

# Limpiamos y movemos tu web
RUN rm -rf /var/www/html/*
COPY --from=builder /app/out /var/www/html

# Ponemos tu ESCUDO de seguridad
COPY proyectos/personales/pPokeApiFront/deploy/seguridad_nginx/nginx.conf /etc/nginx/sites-available/default
COPY proyectos/personales/pPokeApiFront/deploy/seguridad_nginx/.htpasswd /etc/nginx/.htpasswd

# Permisos
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]