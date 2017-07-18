#!/bin/bash

#mongo 192.168.0.106 < /workspace/Procesado/scripts/renting/viajes/limpieza.js
docker create --name container_renting -it procesado
docker start container_renting
docker exec container_renting sh scripts/renting/viajes/procesado.sh
docker cp container_renting:/workspace/Procesado/prueba.html /home/romel/management/tmp/prueba.html
docker stop container_renting
docker rm container_renting 
docker cp /home/romel/management/tmp/prueba.html result_container:/workspace/result_app/web/templates/web/data/renting/consultoria.html
rm tmp/prueba.html


