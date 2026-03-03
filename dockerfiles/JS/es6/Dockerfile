FROM morgadoberruezo/ubnginx

ARG PROYECTO
ARG USUARIO
ARG TIPO
# Actualiza los paquetes e instala herramientas necesarias

ARG RUTA_APP=./proyectos/${TIPO}/${PROYECTO}/src/portfolio

# COPY ./proyectos/${TIPO}/${PROYECTO}/src /root/${USUARIO}/app/${PROYECTO}
RUN mkdir /app
RUN echo ${RUTA_APP}
COPY ./proyectos/${TIPO}/${PROYECTO}/src /var/www/html
RUN chown -R www-data:www-data /var/www/html


RUN mkdir -p /root/admin/JS/es6
COPY ./dockerfiles/JS/es6 /root/admin/JS/es6
RUN chmod +x /root/admin/JS/es6/admin/start.sh
WORKDIR /root/admin/JS/es6
ENTRYPOINT ["./admin/start.sh"]