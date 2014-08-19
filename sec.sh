#!/bin/sh

## Modificar
TIME="30" #segundos
MENSAGENS="msg.txt"
SCRNAME="bc"

## Nao modifique abaixo ""
while :
do
	cat $MENSAGENS | while read linha; do
	screen -S $SCRNAME -X stuff "alert $linha"
	sleep $TIME #espera o tempo para enviar a proxima mensagem
  done
	sleep $TIME #espera o tempo para recomeçar 
done


