ARG AUTOR
FROM eliel/nginx

ENV USUARIO="eliel"
ENV PASSWORD="eliel"
ARG CONTEXT
ARG PROYECTO
ARG GITHUB
ARG TZ



RUN mkdir /home/${USUARIO}/app  
RUN gitclone ${GITHUB} /home/${USUARIO}/app
RUN apt-get update && apt-get install -y curl gnupg software-properties-common

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get install -y nodejs

RUN node --version && npm --version 

COPY ./proyectos/${PROYECTO}/deploy/docker-compose.yml  ./js/react/admin
EXPOSE 3000


WORKDIR /root/admin/nginx
ENTRYPOINT ["./admin/start.sh"]