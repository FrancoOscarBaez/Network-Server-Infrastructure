#!/bin/bash

fechaC=$(date -Is)

if [ ! -d "./logs" ]; then #Se crea el directorio logs, si este no existía
	mkdir logs
fi

#Creación archivo de logs
touch ./logs/backup_home_cliente-03.sh_$fechaC.log
arch="./logs/backup_home_cliente-03.sh_$fechaC.log"

#Si funciona el ping, mediante rsync se copian los archivos de un lugar remoto a local.
if ping -c 1 -W 1 192.168.20.3; then
	rsync -avzrh -stats -e ssh --delete --no-perms --exclude '.cache' cliente03@192.168.20.3:/home /media/disco_backups/ --log-file=$arch
	ls -la /media/disco_backups/home/cliente03/
fi
