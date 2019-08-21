#!/bin/bash
while true
do
clear
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   **************************************************************************"
echo "              Script para actualizar y ver reflectores YSF \33[1;31m by EA3EIZ\33[1;32m   "
echo "   **************************************************************************"
echo ""
echo "\33[1;36m   1)\33[1;37m Actualizar YSFHosts.txt (listado de reflectores)"
echo "\33[1;36m   2)\33[1;37m Ver el listado de reflectores YSF"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
clear
						read -p ' Quieres actualizar el listado de reflectores YSF S/N ?' ejecutar1
		    			case $ejecutar1 in
			            [sS]* ) echo ""
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
                        exit;
		                break;;
						[nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
2) echo ""
while true
do
clear
	        			read -p ' Quieres ver el listado de reflectores YSF S/N ?' ejecutar1
		    			case $ejecutar1 in
						[sS]* ) echo ""
						echo "ok >>>>>"
						cd /home/pi/YSFClients/YSFGateway
						geany YSFHosts.txt
						echo "Ok"
						break;;
						[nN]* ) echo ""
						break;;
esac
done;;

0) echo ""
clear
echo "\33[1;33m   ******************************"
echo "   *                            *"
echo "   *     CERRANDO SCRIPT        *"
echo "   *                            *"
echo "   ******************************"
sleep 1
clear
exit;;	
esac
done
