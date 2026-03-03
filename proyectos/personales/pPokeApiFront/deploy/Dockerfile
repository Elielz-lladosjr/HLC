# ETAPA 1: Construcción (Vite / Frontend)
FROM node:20 AS builder
WORKDIR /app

# 1. Copiamos el package.json desde la ruta REAL que encontraste
COPY proyectos/personales/pPokeApiFront/src/mi-pokedex/package*.json ./

RUN npm install

# 2. Copiamos todo el código de mi-pokedex
COPY proyectos/personales/pPokeApiFront/src/mi-pokedex/ ./

# Compilamos (Vite genera la carpeta /app/dist por defecto)
RUN npm run build

# ETAPA 2: Producción y Ciberseguridad
FROM eliel/cibersecurity

# Instalamos Nginx
RUN apt-get update && apt-get install -y nginx apache2-utils \
    && rm -rf /var/lib/apt/lists/*

# Creamos tu usuario para el examen
RUN useradd -ms /bin/bash eliel

# Limpiamos y movemos tu web desde la carpeta 'dist'
RUN rm -rf /var/www/html/*
COPY --from=builder /app/dist /var/www/html

# Ponemos tu ESCUDO de seguridad (Cuidado aquí con las rutas del COPY)
COPY proyectos/personales/pPokeApiFront/deploy/seguridad_nginx/nginx.conf /etc/nginx/sites-available/default
COPY proyectos/personales/pPokeApiFront/deploy/seguridad_nginx/.htpasswd /etc/nginx/.htpasswd

# Permisos de seguridad
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]