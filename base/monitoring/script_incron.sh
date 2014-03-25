#!/bin/bash

diretorio_monitorado="$1"
evento_monitorado=$2
diretorio_log="$3"

arroba='$@'
hash='$#'
percent='$%'
diretorio_atual=$(pwd)

if [ "IN_CREATE" == "$2" ]; then
	       echo "$diretorio_monitorado IN_CREATE,IN_MODIFY,IN_DELETE,IN_CLOSE_WRITE,IN_MOVE_FROM,IN_MOVE_TO $diretorio_log/script_incron.sh $arroba/$hash $percent $diretorio_log &" >> /etc/incron.d/webroot.conf
fi

if [ "IN_CREATE,IN_ISDIR" == "$2" ]; then
               echo "OLA OLA\n" >> /oi.txt;
	       echo "$diretorio_monitorado/ IN_CREATE,IN_MODIFY,IN_DELETE,IN_CLOSE_WRITE,IN_MOVE_FROM,IN_MOVE_TO $diretorio_log/script_incron.sh $arroba/$hash $percent $diretorio_log &" >> /etc/incron.d/webroot.conf
fi


echo -e "$(date +"%Y-%m-%d %H:%M:%S %Z %N")\t$evento_monitorado\t$diretorio_monitorado" >> /leakbucket.log &



#$(echo -e "$(date +"%Y-%m-%d %H:%M:%S %Z %N")\t$evento_monitorado\t$diretorio_monitorado") >> $3
#/root/scriptsleakbucket/leakbucket.log

