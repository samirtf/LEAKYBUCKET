#!/bin/bash


# LAB 02 - SO - Alunos: Samir T. Feitosa; Iury Gregory
#
#
# ./leakbucket.sh start $dirname - Inicia a ferramenta de monitoramento.
# Todos os arquivos e diretorios abaixo do diretorio $dirname devem ser monitorados.
# ./leakbucket.sh stop - Para a ferramenta de monitoramento.
# ./leakbucket.sh status - Fornece o status atual da ferramenta de monitoramento na saida padrao.
# "started" se ela estiver em execucao, "stopped" caso contrario.
#
# Nao conseguimos resolver o problema de salvar o log no diretorio
# de execucao do leakbucket. Para acabar nao funcionando na maquina
# de testes do lab, deixamos o log sendo salvo na raiz do sistema.
# path: /leakbucket.log
# Passamos o endereco para salvar o log como argumento no arquivo
# webroot.conf do incrond, mas deixamos sem usa-lo para resolver 
# o problema de salvar depois.
#
# comando start || stop || status
arg1=$1

# diretorio raiz de monitoramento 
arg2=$2

diretorio_atual=$(pwd)

arroba='$@'
hash='$#'
percent='$%%'

if [[ "start" == $arg1 ]]
then
    echo "iniciando monitoramento leakbucket"
    find $arg2 -printf "$diretorio_atual/%p IN_CREATE,IN_MODIFY,IN_DELETE,IN_CLOSE_WRITE,IN_MOVE_FROM,IN_MOVE_TO $(pwd)/script_incron.sh $arroba/$hash $percent $diretorio_atual/ & \n" > /etc/incron.d/webroot.conf

fi

if [[ "stop" == $arg1 ]]
then
    >/etc/incron.d/webroot.conf
fi

if [[ "status" == $arg1 ]]
then
    statusIncrond=$(service incrond status)
    statusLeakbucket=$(  awk '{printf "%s",$0} END {print ""}' /etc/incron.d/webroot.conf )

    if [[ "$statusIncrond" == *pid* && "" != "$statusLeakbucket" ]]
    then
        echo "started"
    else
        echo "stopped"
    fi
fi



