set -e

    mkdir /home/eliel/app

config_git(){
    >Git: Clone https://github.com/morgadodesarrollador/Autocaravaneando.git >> /home/eliel/app
    echo "Realización del clone de Autocaravaneando.git" >> /root/logs/archivo.log
}
config_react(){
    if [ ! -d "node_modules" ] 
        then npm install && npm start
    fi
    if [ ! -d "/build" ]
        then npm run build
    fi
    cp /build /var/www/html
    chmod 755 /var/www-data
    echo "Realización de la configuración de react" >> /root/logs/archivo.log
}
main(){
    config_git
    config_react
    tail -f /dev/null 
}

main