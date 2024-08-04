#!/bin/bash
# DIO - Desafio 2 - Projeto de infraestrutura como código
# Passos:
# 1 - Atualizar o servidor
# 2 - Instalar o apache2
# 3 - Instalar o unzip;
# 4 - Baixar a aplicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip em /tmp
# 5 - Copiar os arquivos da aplicação no diretório padrão do apache;
# Script desenvolvido por Willian Andrade <williandrade@gmail.com>
#-----------------------------------------
set LOG=/var/log/install_script_$(date '+%F_%H%M%S').log
# NÃO ALTERAR DESSE PONTO PARA BAIXO
echo
LOG=/var/log/install_script_$(date '+%F_%H%M%S').log
echo "############################################################################" >> $LOG
echo "O log da operação sera gravado em '$LOG'"
echo "# DIO - Desafio 2 - Projeto de infraestrutura como código" >> $LOG
echo "# Passos:" >> $LOG
echo "# 1 - Atualizar o servidor" >> $LOG
echo "# 2 - Instalar o apache2" >> $LOG
echo "# 3 - Instalar o unzip " >> $LOG
echo "# 4 - Baixar a aplicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip em /tmp " >> $LOG
echo "# 5 - Copiar os arquivos da aplicação no diretório padrão do apache " >> $LOG
echo "# Script desenvolvido por Willian Andrade <williandrade@gmail.com> " >> $LOG
echo "############################################################################" >> $LOG
echo 1 - Atualizando o servidor o servidor >> $LOG
echo 1 - Atualizando o servidor o servidor
apt update >> $LOG
echo Base de dados local atualizada.
apt upgrade -y >> $LOG
echo Aplicações atualizadas.

echo # 2 - Instalando o apache2  >> $LOG
echo # 2 - Instalando o apache2 
apt install apache2 -y >> $LOG
echo Apache 2 instalado com sucesso.
echo Ativando o serviço do apache para start automático
systemctl enable apache2 >> $LOG
echo Apache2 ativo para inicialização automática >> $LOG
echo Apache2 ativo para inicialização automática

echo # 3 - Instalar o unzip; >>	$LOG
echo # 3 - Instalar o unzip;
apt install unzip -y >> $LOG
ecgho Unzip instalado com sucesso.

echo # 4 - Baixar a aplicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo # 4 - Baixar a aplicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip >> $LOG

# 5 - Copiar os arquivos da aplicação no diretório padrão do apache;
unzip main.zip >> $LOG
cp -r -v -f /tmp/linux-site-dio-main/* /var/www/html/. >> $LOG
service apache2 restart

echo "##################################################################" $LOG
echo "Processo de preparação do servidor finalizado." >> $LOG
echo "Script finalizado com sucesso. Abrindo log para conferência."
more $LOG
