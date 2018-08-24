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
echo "   *              Script para actualizar ZUMSpot     \33[1;33m       \33[1;32m          *"
echo "   *                          \33[1;31mby EA3EIZ\33[1;32m                               *"
echo "   ********************************************************************"
echo "\33[1;36m   1)\33[1;37m Actualizar Pincho Low Cost Libre"
echo "\33[1;36m   2)\33[1;37m Actualizar ZUMSpot por GPIO"
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
echo "${AMARILLO}"
echo "   ********************************************************************"
echo "   * Haz clik en el icono (Abrir BM, Abrir DMR+, Abrir RAdio, etc.)   *"
echo "   * donde tengas conectado el pincho para que lea la versión         *"
echo "   * cuando se haya conectado cierralo y sigue las instrucciones                 *"
echo "   ********************************************************************"
echo ""
echo ""
echo "${CIAN}"
echo -n "\33[1;36m   Pulsa una tecla para seguir "
read seguir
clear
echo "${BLANCO}"
echo "su versión es:"
echo "${VERDE}"
tac $(ls -1rt /home/pi/MMDVMHost/MMDVM-*.log | tail -n1 ) | grep "protocol" -m 1 | sed -n 's/description: /&\n/;s/.*\n//p'
echo ""  
read -p 'Quieres actualizar S/N: ' continuar
case $continuar in
[sS]* ) echo ""
echo ">>>>>>>>> ACTUALIZAR FIRMWARE ZUMSpot"
                     
    echo "${CIAN}"
    rm -rf /tmp/zumfirmware 2> /dev/null
    mkdir /tmp/zumfirmware 2> /dev/null
    echo "Flashing your ${1} modem to the latest version"
    curl -s -L https://github.com/juribeparada/MMDVM_HS/releases/latest | egrep -o '/juribeparada/MMDVM_HS/releases/download/v[0-9.]*/install_fw_librekit.sh' | wget --base=http://github.com/ -i - -O /tmp/zumfirmware/flash.sh
    chmod +x /tmp/zumfirmware/flash.sh
    cd  /tmp/zumfirmware
    ./flash.sh
    rm -rf /tmp/zumfirmware 2> /dev/null
    echo "${BLANCO}"
    echo "SE HA ACTUALIZADO A LA ÚLTIMA VERSIÓN:"
    echo "${VERDE}"
    echo "" 
    read -p 'pulsa una tecla para reiniciar' continuar
    udo reboot
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
echo "${AMARILLO}"
echo "   ********************************************************************"
echo "   * Haz clik en el icono (Abrir BM, Abrir DMR+, Abrir RAdio, etc.)   *"
echo "   * donde tengas conectado el pincho para que lea la versión         *"
echo "   * cuando se haya conectado cierralo y sigue las instrucciones                 *"
echo "   ********************************************************************"
echo ""
echo ""
echo "${CIAN}"
echo -n "\33[1;36m   Pulsa una tecla para seguir "
read seguir
clear
echo "${BLANCO}"
echo "su versión es:"
echo "${VERDE}"
tac $(ls -1rt /home/pi/MMDVMHost/MMDVM-*.log | tail -n1 ) | grep "protocol" -m 1 | sed -n 's/description: /&\n/;s/.*\n//p'
echo ""  
read -p 'Quieres actualizar S/N: ' continuar
case $continuar in
[sS]* ) echo ""
echo ">>>>>>>>> ACTUALIZAR FIRMWARE ZUMSpot"
                     
    echo "${CIAN}"
    rm -rf /tmp/zumfirmware 2> /dev/null
    mkdir /tmp/zumfirmware 2> /dev/null
    echo "Flashing your ${1} modem to the latest version"
    curl -s -L https://github.com/juribeparada/MMDVM_HS/releases/latest | egrep -o '/juribeparada/MMDVM_HS/releases/download/v[0-9.]*/install_fw_rpi.sh' | wget --base=http://github.com/ -i - -O /tmp/zumfirmware/flash.sh
    chmod +x /tmp/zumfirmware/flash.sh
    cd  /tmp/zumfirmware
    ./flash.sh
    echo ""
    rm -rf /tmp/zumfirmware 2> /dev/null
    echo "${BLANCO}"
    echo "SE HA ACTUALIZADO A LA ÚLTIMA VERSIÓN:"
    echo "${VERDE}"
    echo "" 
    read -p 'pulsa una tecla para reiniciar' continuar
    sudo reboot
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

