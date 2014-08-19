#!/bin/bash
# /etc/init.d/mensagens
# version 2014-08-16

### BEGIN INIT INFO
# Provides: minecraft
# Required-Start: $local_fs $remote_fs
# Required-Stop: $local_fs $remote_fs
# Should-Start: $network
# Should-Stop: $network
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Announcer
# Description: Sistema de mensagens
### END INIT INFO

# Sistema de mensagens para Craftbukki/Spigot
# Copyright (C) 2014 Sephs <sephs@radioblast.com.br>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Source the function library
## CentOS/Fedora
if [ -f /etc/rc.d/init.d/functions ]
then
. /etc/rc.d/init.d/functions
fi
## Ubuntu
if [ -f /lib/lsb/init-functions ]
then
. /lib/lsb/init-functions
fi

# Configurações:

# Nome da screen que ira rodar o BungeeCord/Craft/Spigot
SCRNAME="bc"
SERVICE="BungeeCord.jar"

# Pasta onde ira estar os arquivos msg.txt/princ.sh/sec.sh
MSGPATH="/root/mensagens"
# Nome da screen que ira rodar o loop do sistema de mensagens
MSGNAME="MSG"
SCRIPT="$MSGPATH/sec.sh"

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
then
	if messages_running
	  then
	    echo "[ERRO] Sistema de mensagens esta rodando"
	    exit 1;
          else
	    screen -d -m -S $MSGNAME $SCRIPT 
        fi
else
     echo "[ERRO] Servidor esta desligado"
fi
}

## Stop the message service
msg_stop(){

if server_running
then
	echo "[ERRO] Servidor esta ligado"
	exit 1;
else
	if messages_running
	then
	  kill $SHMSG
	  kill $SMGPID
	  exit 0;
	else
	  echo "[ERRO] Servidor de mensagens esta desligado"
	  exit 1;
	fi
fi
}

## Parametros

case "$1" in
start)
msg_start
;;

stop)
msg_stop
;;

restart)
msg_stop
sleep 1
msg_start
;;

*)
echo "Usage: mensagens {start|stop|restart}"
exit 1
;;

esac

# no errors
exit 0
