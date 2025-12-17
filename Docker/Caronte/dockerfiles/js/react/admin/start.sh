#!/bin/bash
set -e

config_react():
  if "node_modules" == ${PROYECTO}
    do npm install 
  else 
    print "EL archivo se encuentra en el lugar";
  
    do npm start from port 3000;
  
    if "build" == ${PROYECTO}
    do run build 
  else 
    print "EL archivo se encuentra en el lugar";