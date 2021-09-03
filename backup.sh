#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

echo "Start BACKUP ------------------------------------"

DIA=$(date +%d%m%y)

count=$(find /import -maxdepth 1 -name '*.tar.gz' | wc -l)

cd ../../srv/samba 

if [ -e "bkp_samba_$DIA.tar.gz" ] ; then
  echo "O arquivo existe, entao nao foi criado um novo"
else
  echo "O arquivo não existe e foi guardado na pasta backup"
  tar -zcvf bkp_samba_$DIA.tar.gz .
  cp bkp_samba_$DIA.tar.gz ../backup/ 
fi
