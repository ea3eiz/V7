#!/bin/bash
echo "*************************************"
echo "* ACTUALIZANDO LISTADO DE SALAS YSF *"
echo "* ***********************************"
sleep 3
			cd /home/pi/YSFClients/YSFGateway
			sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php
			sleep 3


