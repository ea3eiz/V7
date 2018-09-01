#!/bin/bash
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
clear
echo "*************************************"
echo "* ACTUALIZANDO LISTADO DE SALAS YSF *"
echo "* ***********************************"
sleep 3
			cd /home/pi/YSFClients/YSFGateway
			sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php
			sleep 3
clear

echo "${AMARILLO}"			
echo "**********************************************************"
echo "* El fichero YSFHost.txt se ha actualizado correctamente *"
echo "**********************************************************"
sleep 3
