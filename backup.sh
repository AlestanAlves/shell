#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

DIA=$(date +%d%m%y)

tar -zcvf bkp_samba_$DIA.tar.gz /srv/samba/

