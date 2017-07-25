#!/bin/bash

#mongo 192.168.0.106 < /workspace/Procesado/scripts/renting/viajes/limpieza.js
docker create --name container_renting -it procesado 
docker start container_renting
docker exec container_renting python scripts/renting/viajes/prueba.py
docker cp  container_renting:/workspace/Procesado/prueba.html /home/romel/data/templates/data/renting/consultoria.html
docker stop container_renting
docker rm container_renting 

