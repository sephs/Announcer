Announcer - Message System (1.0)

by Sephs <sephs@radioblast.com.br>

Esse sistema de mensagens funciona no Minecraft Server/Craftbukkit/Spigot no CentOS, Fedora, and Ubuntu/Debian.

Para o seu correto funcionamento será necessário mudar no arquivo sec.sh:

No caso do Spigot é utilizado alert
No Craftbukkit/Minecraft é utlizado say

Instalação:

Na mesma pasta que for colocar os arquivos:

1) Edite o arquivo princ.sh, na area de configurações:

# Nome da screen que ira rodar o BungeeCord/Craft/Spigot
SCRNAME="bc"
SERVICE="BungeeCord.jar" # Pode ser Craftbukkit, Spigot, BungeeCord
# Pasta onde ira estar os arquivos msg.txt/princ.sh/sec.sh
MSGPATH="/root/mensagens"
# Nome da screen que ira rodar o loop do sistema de mensagens
MSGNAME="MSG"

2) Crie um arquivo msg.txt - nele serão adcionados as mensagens por linha que você deseja exibir em seu servidor

Aplique para todos chmod a+x

Crie um link simbolico:
ln -s /path/princ.sh /etc/init.d/mensagens

Caso seu servidor utilize um script de inicialização só iniciar os comandos a seguir

/etc/init.d/mensagens stop - Para quando for reiniciar, ele parar o server

/etc/init.d/mensagens start - Após a linha de inicio do server, vc ligar o server de mensagens

Próximas Atualizações:

Configurar para fazer o sistema ser automatico, para ligar e desligar.




    



