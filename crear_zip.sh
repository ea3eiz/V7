#!/bin/bash

            cd /home/pi/MMDVMHost
            sudo cp -f MMDVM.ini /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVM.ini_copia3 /home/pi/Downloads
            sudo cp -f MMDVM.ini_original /home/pi/Downloads
            sudo cp -f MMDVMBM.ini /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVMBM.ini_copia3 /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini_uno /home/pi/Downloads
            sudo cp -f MMDVMLIBRE.ini_dos /home/pi/Downloads      
            sudo cp -f MMDVMPLUS.ini /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia2 /home/pi/Downloads
            sudo cp -f MMDVMPLUS.ini_copia3 /home/pi/Downloads

            sudo cp -f MMDVMDMR2NXDN.ini /home/pi/Downloads
            sudo cp -f MMDVMDMR2YSF.ini /home/pi/Downloads

            cp -f /home/pi/DMR2NXDN/DMR2NXDN.ini  /home/pi/Downloads
            cp -f /home/pi/NXDNClients/NXDNGateway/NXDNGateway.ini  /home/pi/Downloads
            cp -f /home/pi/DMR2YSF/DMR2YSF.ini  /home/pi/Downloads

            #solo Dstar y solo Fusion
            cp -f MMDVMDSTAR.ini /home/pi/Downloads
            cp -f MMDVMFUSION.ini /home/pi/Downloads
            #fin  Dstar y solo Fusion

            cd  /home/pi/YSF2DMR
            cp -f YSF2DMR.ini /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_01 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_02 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_03 /home/pi/Downloads
            cp -f YSF2DMR.ini_copia_04 /home/pi/Downloads

            cd  /home/pi/DMR2YSF
            cp -f TG-YSFList.txt /home/pi/Downloads

            cd  /home/pi/YSFClients/YSFGateway/
            sudo cp -f YSFGateway.ini /home/pi/Downloads
            
            cd /home/pi/bluedv/
            sudo cp -f BlueDVconfig.ini /home/pi/Downloads

            cd /usr/local/etc/svxlink/
            sudo cp -f svxlink.conf /home/pi/Downloads

            cd /usr/local/etc/svxlink/svxlink.d/
            sudo cp -f ModuleEchoLink.conf /home/pi/Downloads

            cp /usr/local/etc/opendv/ircddbgateway /home/pi/Downloads
            cp /usr/local/etc/opendv/dstarrepeater /home/pi/Downloads

            cd /home/pi
            cp info_panel_control.ini /home/pi/Downloads
            
cd /home/pi/
tar -zcvf copia.tar.gz Downloads
cp  copia.tar.gz /var/www/html/upload/files
sudo rm copia.tar.gz
