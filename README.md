Announcer - Message System (1.0)

by Sephs < sephs@radioblast.com.br>

Esse sistema de mensagens funciona no Minecraft Server/Craftbukkit/Spigot no CentOS, Fedora, and Ubuntu/Debian.

Para o correto funcionamento do envio de mensagens será necessário mudar no arquivo sec.sh:

No caso do Spigot é utilizado alert
No Craftbukkit/Minecraft é utlizado say

Instalação:

É necessário possui screen, ter acesso aos comandos ps, grep.
Crie um arquivo msg.txt - nele serão adcionados as mensagens por linha que você deseja exibir em seu servidor
Aplique para todos chmod a+x
Crie um link simbolico do arquivo princ.sh para /etc/init.d/mensagens
Coloque na cron, o arquivo check.




    



