#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

echo "Start BACKUP ------------------------------------"

DIA=$(date +%d%m%y)

exists=$(find ../../srv/backup -maxdepth 5 -name '*.tar.gz' | wc -lc -l)

cd ../../srv/samba 

if [ exists =! 5 ] ; then
  if [ -e "bkp_samba_$DIA.tar.gz" ] ; then
    echo "O arquivo existe, entao nao foi criado um novo"
  else
    echo "O arquivo não existe e foi guardado na pasta backup"
    tar -zcvf bkp_samba_$DIA.tar.gz .
    cp bkp_samba_$DIA.tar.gz ../backup/ 
  fi
