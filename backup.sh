#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

echo $(date '+%Y %b %d %H:%M') "--------- Start BACKUP ------------------------------------" >> backup.log

dia=$(date +%d%m%y)

total=$(ls ../../srv/backup/*.tar.gz 2>/dev/null| wc -l)

cd ../../srv/samba 

if [ ${total} -eq "5" ] ; then
  echo $(date '+%Y %b %d %H:%M')  "---- Existe 5 arquivos em backup o arquivo mais antigo criado foi excluido" >> backup.log | mail -s "existe 5 arquivos de backup" alestanalves@gmail.com
  find ../backup/ -mtime +5 -exec rm {} \;
elif [ -e "bkp_samba_$dia.tar.gz" ] ; then
  echo $(date '+%Y %b %d %H:%M')  "----- O arquivo existe, entao nao foi criado um novo" >> backup.log | mail -s "arquivo existente" alestanalves@gmail.com
else
  echo $(date '+%Y %b %d %H:%M') "----- O arquivo de backup gerado com sucesso" >> backup.log | mail -s "O arquivo de backup gerado" alestanalves@gmail.com
  tar -zcvf bkp_samba_$dia.tar.gz .
  cp bkp_samba_$dia.tar.gz ../backup/ 
fi
