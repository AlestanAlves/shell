#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

DIA=$(date +%d%m%y)

cd ../../srv/samba 

if [ -e "bkp_samba_$DIA.tar.gz" ] ; then
  echo "o arquivo existe"

else
  echo "o arquivo não existe"
  tar -zcvf bkp_samba_$DIA.tar.gz .
  cp bkp_samba_$DIA.tar.gz ../backup/ 
fi
 

#tar -zcvf bkp_samba_$DIA.tar.gz .
 
#cp bkp_samba_$DIA.tar.gz ../backup/ 
