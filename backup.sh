#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

echo "Start BACKUP ------------------------------------"

DIA=$(date +%d%m%y)

exists=$(find ../../srv/backup -maxdepth 5 -name '*.tar.gz' | wc -lc -l)

ls /import/*.zip 2>/dev/null| wc -l

cd ../../srv/samba 

if [ exists == 5 ] ; then
  echo "Existe 5 arquivos em backup a ultima data foi excluida"
elif [ -e "bkp_samba_$DIA.tar.gz" ] ; then
  echo "O arquivo existe, entao nao foi criado um novo"
else
  echo "O arquivo não existe e foi guardado na pasta backup"
  tar -zcvf bkp_samba_$DIA.tar.gz .
  cp bkp_samba_$DIA.tar.gz ../backup/ 
fi
