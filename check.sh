#!/bin/bash
# version 2014-08-16
# Criado por Sephs <sephs@radioblast.com.br>

# Configurações:

# Nome da screen que ira rodar o BungeeCord/Craft/Spigot
SCRNAME="bc"
SERVICE="BungeeCord.jar"

# Nome da screen que ira rodar o loop do sistema de mensagens
MSGNAME="MSG"

# Nao modificar aqui embaixo

server_running() {

SCREENPID=""
SCREENPID="$(ps -ef | grep -v grep | grep -i screen | grep $SCRNAME | awk '{print $2}')"

if [ -z "$SCREENPID" ]
  then
  return 1
fi

JAVAPID="$(ps -f --ppid $SCREENPID | grep $SERVICE | awk '{print $2}')"

if [ -z "$JAVAPID" ]
  then
  return 1
fi

  return 0 #Retorna sucesso, se ambos testes acima forem verdadeiros
}

messages_running() {

SMSGPID=""
SMGPID="$(ps -ef | grep -v grep | grep -i screen | grep $MSGNAME | awk '{print $2}')"

if [ -z "$MSGPID" ]
then
  return 1
fi

SHMSG=""
SHMSG="$(ps -ef | grep -v grep | grep -i screen | grep sec | awk '{print $2}')"

if [ -z "$SHMSG" ]
then
  return 1 #false 
fi

 return 0; #true
}

## Start the message service
msg_start() {
	
if  server_running 
then #Ligado
	if ! messages_running #Desligado
        then
		/etc/init.d/mensagens start
        fi
else #Desligado
	if messages_running # Ligado
	then
		/etc/init.d/mensagens stop
	fi
fi
}

msg_start
