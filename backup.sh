#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

echo "Start BACKUP ------------------------------------"

dia=$(date +%d%m%y)

total=$(ls ../../srv/backup/*.tar.gz 2>/dev/null| wc -l)

cd ../../srv/samba 

if [ ${total} -eq "5" ] ; then
  echo "Existe 5 arquivos em backup o arquivo mais antigo criado foi excluido"
  find ../backup/* -mtime +1 -exec rm {} \; 
elif [ -e "bkp_samba_$dia.tar.gz" ] ; then
  echo "O arquivo existe, entao nao foi criado um novo"
else
  echo "O arquivo não existe e foi guardado na pasta backup"
  tar -zcvf bkp_samba_$dia.tar.gz .
  cp bkp_samba_$DIA.tar.gz ../backup/ 
fi
