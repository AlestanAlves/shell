#!/bin/bash  
#Script de backup
#Autor: Alestan
#RM: 85046
#
#

DIA=$(date +%d%m%y)

cd ../../srv/samba 

tar -zcvf bkp_samba_$DIA.tar.gz .
 
cp bkp_samba_$DIA.tar.gz ../backup/ 
