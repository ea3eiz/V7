#!/bin/bash
while true
do
clear
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   ********************************************************************"
echo "   *      Script para hacer actualizaciones y varios \33[1;33m       \33[1;32m          *"
echo "   *                          \33[1;31mby EA3EIZ\33[1;32m                               *"
echo "   ********************************************************************"
echo "\33[1;36m   1)\33[1;37m Actualizar imagen"
echo "\33[1;36m  2a)${AMARILLO} ACTUALIZAR YSF2DMR"
echo "\33[1;36m  2b)${AMARILLO} ACTUALIZAR DMR2YSF"
echo "\33[1;36m  2c)${AMARILLO} ACTUALIZAR DMR2NXDN"
echo ""
echo "\33[1;32m      APARTADO BLUETOOTH"
echo "\33[1;32m      =================="
echo "\33[1;36m   3)\33[1;33m Activar el Bluetooth (en la imagen viene desactivado por defecto)"
echo "\33[1;36m   4)\33[1;33m Desactivar Bluetooth (esto habilita el puerto /dev/ttyAMA0)"
echo "\33[1;36m   5)\33[1;32m PDF con las instrucciones para emparejar el Bluetooth"
echo "\33[1;36m   6)\33[1;37m Anclar el puerto rfcomm0 para conectar el Bluetooth para siempre"
echo "\33[1;36m   7)\33[1;37m Anclar el puerto rfcomm1 para conectar el Bluetooth para siempre"
echo ""
echo "\33[1;36m   8)\33[1;37m INSTALAR ANYDESK ${ROJO}(reiniciar después de instalar)"
echo "\33[1;36m   9)\33[1;37m Grabar Pantalla Nextion"
echo ""
echo "\33[1;36m  10)${VERDE} MENÚ ACTUALIZAR MMDVM_HS Libre kit y ZUMSpot"
echo ""
echo "\33[1;36m  11)\33[1;31m REINICIAR EL SISTEMA"
echo ""
echo "\33[1;36m   0)\33[1;34m Salir del script \33[1;31m OJO!! no salir con ctrl+c ni con la x"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
clear
                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> ACTUALIZANDO >>>>>>>>"
                        cd /home/pi/$SCRIPTS_version
                        sudo git pull
                        sleep 1


                        #comprueba si el fichero existe
                        if [ -f /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini ];
                        then
                        echo ""
                        else
                        cp /home/pi/$SCRIPTS_version/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini /home/pi/
                        fi
                        #================================

                        #ARREGLA EL ICONO Abrir DMR+
                        #cd /home/pi/$SCRIPTS_version/Desktop
                        #cp Abrir_MMDVMPLUS /home/pi/Desktop

                        #ARREGLA EL ICONO Abrir BM+
                        #d /home/pi/$SCRIPTS_version/Desktop
                        #cp Abrir_MMDVMBM /home/pi/Desktop
                        



                        clear                                                              
                        exit;
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
2a) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear

                        #comprueba si la versión a cambiado
                        version_YSF2DMR_actual=$(awk "NR==22" /home/pi/YSFClients/YSFGateway/Version.h)
                        version_YSF2DMR_instalada=$(awk "NR==8" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_YSF2DMR_actual" = "$version_YSF2DMR_instalada" ];
                        # =================================
                        then 
                        echo "************************************************************"
                        echo "*   YA TIENES LA ÚLTIMA VERSIÓN YSFClientes/YSFGateway     *"
                        echo "*   $version_YSF2DMR_actual                      *"
                        echo "************************************************************"
                        sleep 4
                        clear
                        else
                        sed -i "7c Versión YSFClientes/YSFGateway:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "8c $version_YSF2DMR_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${VERDE}DESCARGANDO E INSTALANDO EL ÚLTIMO YSFClients${CIAN}"
                        sleep 3
                        sudo rm -R /home/pi/YSFClients
                        cd /home/pi
                        git clone https://github.com/g4klx/YSFClients
                        cd /home/pi/YSFClients/YSFGateway
                        make clean
                        make

                        cp /home/pi/YSF2DMR/YSF2DMR.ini /home/pi

                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/YSF2DMR
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir YSF2DMR
                        cp /home/pi/MMDVM_CM/YSF2DMR/* /home/pi/YSF2DMR/
                        cd /home/pi/YSF2DMR/
                        fi


                        #comprueba si la versión a cambiado
                        version_YSF2DMR_actual=$(awk "NR==23" /home/pi/YSF2DMR/Version.h)
                        version_YSF2DMR_instalada=$(awk "NR==2" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_YSF2DMR_actual" = "$version_YSF2DMR_instalada" ];
                        # =================================
                        then    
                        clear
                        echo "${BLANCO}"
                        echo "*******************************************"
                        echo "*  TIENES LA ÚLTIMA VERSIÓN YSF2DMR       *"
                        echo "*  $version_YSF2DMR_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${AMARILLO}"
                        echo "*******************************************"
                        echo "*  TIENES LA ÚLTIMA VERSIÓN YSF2DMR       *"
                        echo "*  $version_YSF2DMR_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*  TIENES LA ÚLTIMA VERSIÓN YSF2DMR       *"
                        echo "*  $version_YSF2DMR_actual      *"
                        echo "*******************************************"
                        sleep 3

                        mv /home/pi/YSF2DMR.ini /home/pi/YSF2DMR


                        #la versión es nueva la instalamos y ponemos la version.h en versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        else
                        sed -i "1c Versión YSF2DMR:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini      
                        sed -i "2c $version_YSF2DMR_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO YSF2DMR              *"
                        echo "*******************************************"
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 
                        sudo chmod 777 -R /home/pi/YSF2DMR

                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_01
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_02
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_03
                        cp /home/pi/YSF2DMR/YSF2DMR.ini YSF2DMR.ini_copia_04

                        fi 
                     
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
2b) echo ""
while true
do
clear
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear
                        #comprueba si la versión a cambiado
                        version_YSF2DMR_actual=$(awk "NR==22" /home/pi/YSFClients/YSFGateway/Version.h)
                        version_YSF2DMR_instalada=$(awk "NR==8" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_YSF2DMR_actual" = "$version_YSF2DMR_instalada" ];
                        # =================================
                        then 
                        echo "************************************************************"
                        echo "*   YA TIENES LA ÚLTIMA VERSIÓN YSFClientes/YSFGateway     *"
                        echo "*   $version_YSF2DMR_actual                      *"
                        echo "************************************************************"
                        sleep 5
                        clear
                        else
                        sed -i "7c Versión YSFClientes/YSFGateway:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "8c $version_YSF2DMR_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${VERDE}DESCARGANDO E INSTALANDO EL ÚLTIMO YSFClients${CIAN}"
                        sleep 3
                        sudo rm -R /home/pi/YSFClients
                        cd /home/pi
                        git clone https://github.com/g4klx/YSFClients
                        cd /home/pi/YSFClients/YSFGateway
                        make clean
                        make
                        
                        cp /home/pi/DMR2YSF/DMR2YSF.ini /home/pi

                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/DMR2YSF
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir DMR2YSF
                        cp /home/pi/MMDVM_CM/DMR2YSF/* /home/pi/DMR2YSF/
                        cd /home/pi/DMR2YSF/
                        fi
                        #comprueba si la versión a cambiado
                        version_DMR2YSF_actual=$(awk "NR==23" /home/pi/DMR2YSF/Version.h)
                        version_DMR2YSF_instalada=$(awk "NR==4" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_DMR2YSF_actual" = "$version_DMR2YSF_instalada" ];
                        # =================================
                        then    
                        clear
                        echo "${BLANCO}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMR2YSF      *"
                        echo "*  $version_DMR2YSF_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${AMARILLO}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMR2YSF      *"
                        echo "*  $version_DMR2YSF_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMR2YSF      *"
                        echo "*  $version_DMR2YSF_actual      *"
                        echo "*******************************************"
                        sleep 3
                        mv  /home/pi/DMR2YSF.ini /home/pi/DMR2YSF/
                        
                        #la versión es nueva la instalamos y ponemos la version.h en versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        else
                        sed -i "3c Versión DMR2YSF:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "4c $version_DMR2YSF_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO DMR2YSF             *"
                        echo "*******************************************"
                        cd /home/pi/DMR2YSF/
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 


                        cd /home/pi/MMDVMHost
                        cp MMDVM.ini MMDVMDMR2YSF.ini


                        fi                                         
                        

                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
2c) echo ""
while true
do
clear
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear
                        #comprueba si la versión a cambiado 
                        version_NXDNClients_actual=$(awk "NR==22" /home/pi/NXDNClients/NXDNGateway/Version.h)
                        version_NXDNClients_instalada=$(awk "NR==10" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_NXDNClients_actual" = "$version_NXDNClients_instalada" ];
                        # =================================
                        then 
                        echo "************************************************************"
                        echo "*   YA TIENES LA ÚLTIMA VERSIÓN NXDNClients/NXDNGateway    *"
                        echo "*   $version_NXDNClients_actual                      *"
                        echo "************************************************************"
                        sleep 5
                        clear
                        else
                        sed -i "9c Versión NXDNClients/NXDNGateway:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "10c $version_NXDNClients_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini 
                        echo "${VERDE}DESCARGANDO E INSTALANDO EL ÚLTIMO NXDNClients${CIAN}"
                        sleep 3
                        sudo rm -R /home/pi/NXDNClients
                        cd /home/pi
                        git clone https://github.com/g4klx/NXDNClients
                        cd /home/pi/NXDNClients/NXDNGateway
                        make clean
                        make
                        fi

                        

                        #comprueba si la versión a cambiado
                        version_DMR2NXDN_actual=$(awk "NR==23" /home/pi/DMR2NXDN/Version.h)
                        version_DMR2NXDN_instalada=$(awk "NR==6" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        if [ "$version_DMR2NXDN_actual" = "$version_DMR2NXDN_instalada" ];
                        # =================================
                        then    
                        clear
                        echo "${BLANCO}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMRNXDN      *"
                        echo "*  $version_DMR2NXDN_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${AMARILLO}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMRNXDN      *"
                        echo "*  $version_DMR2NXDN_actual      *"
                        echo "*******************************************"
                        sleep 3
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*   TIENES LA ÚLTIMA VERSIÓN DMRNXDN      *"
                        echo "*  $version_DMR2NXDN_actual      *"
                        echo "*******************************************"
                        
                        else
                        #preparando el DMR2NXDN para compilarlo en el caso que hubiera una nueva versión           
                        cd /home/pi/
                        sudo rm -R /home/pi/MMDVM_CM
                        sudo rm -R /home/pi/DMR2NXDN
                        git clone http://github.com/juribeparada/MMDVM_CM
                        mkdir DMR2NXDN
                        cp /home/pi/MMDVM_CM/DMR2NXDN/* /home/pi/DMR2NXDN/
                        cd /home/pi/DMR2NXDN/

                        #la versión es nueva la instalamos y ponemos la version.h en versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "5c Versión DMR2NXDN:" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        sed -i "6c $version_DMR2NXDN_actual" /home/pi/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini
                        echo "${ROJO}"
                        echo "*******************************************"
                        echo "*         INSTALANDO DMR2NXDN             *"
                        echo "*******************************************"
                        make clean
                        make
                        clear                      
                        sudo chmod +x -R /home/pi/Desktop 
                        sudo chmod 777 -R /home/pi/NXDNClients/NXDNGateway

                        cd /home/pi/MMDVMHost
                        cp MMDVM.ini MMDVMDMR2NXDN.ini

                        fi                                         
                        
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;            
3) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ****************************************************"
echo "   *            SI SE ACTIVA EL BLUETOOTH             *"
echo "   * EL DVMEGA PINCHADO EN LA RASPBERRY NO FUNCIONARÁ *"
echo "   * SE REINICIAR EL SISTEMA PARA APLICAR EL CAMBIO   *"
echo "   ****************************************************"
echo ""
echo "${VERDE}"                                               
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
	                        case $seguir in
			            [sS]* ) echo ""
					echo "ACTIVANDO BLUETOOTH"
					sed -i "57c #dtoverlay=pi3-disable-bt" /boot/config.txt
			            sudo reboot
                              break;;
		                  [nN]* ) echo ""
clear
break;;
esac
done;;
4) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ***************************************************"
echo "   *         SI SE DESACTIVA EL BLUETOOTH            *"
echo "   * SE REINICIAR EL SISTEMA PARA APLICAR EL CAMBIO  *"
echo "   ***************************************************"
echo "" 
echo "${VERDE}"                                              
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
                        case $seguir in
                        [sS]* ) echo ""
                        echo "DESACTIVANDO BLUETOOTH"
                        sed -i "57c dtoverlay=pi3-disable-bt" /boot/config.txt
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
clear
break;;
esac
done;;
5) echo ""
while true
do
clear

	                	ejecutar1=S
		    			case $ejecutar1 in
						[sS]* ) echo ""
						echo ">>>>>>>>> EMPAREJAR BLUETOOTH >>>>>>>>"
                        cd /home/pi/SCRIPTS_version
                        evince ./EMPAREJAR_BLUETOOTH.pdf
                        clear
                        exit;
						break;;
						[nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
6) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
						sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm0 $mac'" /home/pi/.config/autostart/actualizar.desktop
						clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm0   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo " "
clear
exit;
break;;
esac
done;;
7) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
						sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm1 $mac'" /home/pi/.config/autostart/actualizar.desktop
						clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm1   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
8) echo ""
while true
do
clear
                        
						
						#comprueba si el ficgero existe
                        if [ -d /home/pi/.anydesk ];
                        then
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*       ANYDESK YA ESTÁ INSTALADO         *"
                        echo "*******************************************"
                        sleep 5
                        instalarsi="N"
                        else
                        instalarsi="S"
                        fi
                        #================================

                        case $instalarsi in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> INSTALANDO ANYDESK >>>>>>>>"

                        cd /home/pi/Downloads
                        wget http://download.anydesk.com/rpi/anydesk_2.9.4-1_armhf.deb
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        sudo apt-get -f install
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        echo "Anydesk Instalado"
                        sleep 2
                        break;;
                        [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
9) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL >>>>>>>>"
                        sudo sh grabar_nextion_05.sh
                        exit;
		                break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
10) echo ""
while true
do
clear
                                ejecutar1=S
                                case $ejecutar1 in
                                [sS]* ) echo ""

echo "${ROJO}"
echo "   *********************************************************"
echo "   * ATENCIÒN!!! Si estás utilizando la Raspberry pi 3 B+  *"
echo "   * Dicha máquina tiene los puertos USB de alta velocidad *"
echo "   * por lo que tendrás que utilizar un ladrón de USB      *"
echo "   * para poder rebajar la velocidad de los puertos USB    *"
echo "   * y así poder grabar los pinchos sin ningun problema    *"
echo "   *********************************************************"
echo "${VERDE}"

echo "${AMARILLO}"
echo "   *********************************************************************"
echo "   * Haz clik en el icono donde tengas conectado el pincho             *"
echo "   * una vez se abra la consola mostrando que se conectó correctamente *"
echo "   * cierra dicha consola y utiliza el MENÚ que te aparecerá           *"
echo "   *********************************************************************"
echo "${VERDE}"
echo -n "    Pulsa una tecla para seguir "
read a
                                sh flash_mmdvm_hs.sh
                                echo ""
                                break;;
                                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
11) echo ""
while true
do
clear
echo " \33[1;31m  ************************************************************"
echo "   *                                                          *"
echo "   *     OJO!!   SE VA A REINICIAR EL SISTEMA                 *"
echo "   *                                                          *"
echo "   ************************************************************"
echo ""
                read -p '   Estás seguro de querer reiniciar ? Si/No: ' ejecutar13
                    case $ejecutar13 in
                        [sS]* ) echo ""
                        echo "ok >>>>>"
                        sudo reboot
                        echo ""
                        echo "Ok, se ha ejecutado correctamente"
                        echo ""
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;
iconosbloqueados) echo ""
while true
do
clear
                        echo "\33[1;31m" #color rojo
                        echo " *****************************************************"
                        echo " ******   OJO!!! CLONA TODOS LOS ICONOS         ******"
                        echo " *****************************************************"
                        echo "\33[1;37m" #color
                        read -p 'Quieres Actualizar? S/N ' ejecutar1
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> RESTAURANDO ICONOS >>>>>>>>"
                        sudo rm -R /home/pi/$SCRIPTS_version
                        sleep 2
                        cd /home/pi
                        git clone https://github.com/ea3eiz/$SCRIPTS_version
                        cp -R /home/pi/$SCRIPTS_version/Desktop /home/pi/
                        clear
                        exit;
                        break;;
                        [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
9000) echo ""
while true
do
clear
                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo " *****************************************************"
                        echo " ******   OJO!!! CLONA TODOS LOS ICONOS         ******"
                        echo " *****************************************************"
                        sudo rm -R /home/pi/$SCRIPTS_version
                        cd /home/pi
                        git clone https://github.com/ea3eiz/$SCRIPTS_version
                        cp -R /home/pi/$SCRIPTS_version/Desktop /home/pi/
                        exit;
                        break;;
                        [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
9001) echo ""
while true
do
clear

                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> RECOGE AUTOARRANQUES_V6 >>>>>>>>"
                        cd /home/pi
                        sudo rm -R /home/pi/AUTOARRANQUE_V6
                        git clone http://github.com/ea3eiz/AUTOARRANQUE_V6
                        exit;
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
9002) echo ""
while true
do
clear
 
                        ejecutar1=S
                        case $ejecutar1 in
                        [sS]* ) echo ""
                        echo ">>>>>>>>> ACTUALIZAR FIRMWARE MMDVM_HS"
                        cd /home/pi/$SCRIPTS_version
                        sudo sh flash_mmdvm_hs.sh
                        exit;
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
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
