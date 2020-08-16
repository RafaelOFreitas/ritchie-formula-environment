#!/bin/sh

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

runFormula() {
  echo $SAMPLE_LIST

  sayHello

  case $SAMPLE_LIST in
  "Configuração completa")
    installSPropertiesCommon
    installWget
    installCertificates
    installCurl
    installGnupgAgent
    installSnap
    installChrome
    installSpotify
    installDiscord
    installVsCode
    installJdk
    installGit
    installMaven
    installDocker
    installIntellij
    installPostaman
    installMySql
    installMySqlWorkbench

    finishInstall
    ;;
  "Selecionar programas")
    echo "Selecionar"
    ;;
  *) echo -e "${RED}Opção inválida, tente novamente!" ;;
  esac
}

sayHello() {
  echo "sudo apt install lolcat -y"
  echo "sudo apt install cowsay -y"

  cowsay -f gnu Configurando ambiente com RITCHIE! 🦸🚀 | lolcat

  printf "\n${GREEN}Versão do SO: %s\n"
  lsb_release -r
}

installSPropertiesCommon() {
  start "Iniciando instalação de Properties Common"

  echo "sudo apt install software-properties-common -y >/dev/null"

  finish "Instalação de Properties Common Concluída"
}

installWget() {
  start "Iniciando instalação do GNU Wget"

  echo "sudo apt install apt-transport-https wget -y >/dev/null"

  finish "Instalação do GNU Wget Concluída"
}

installCertificates() {
  start "Iniciando instalação de Certificados"

  echo "sudo apt install ca-certificates -y >/dev/null"

  finish "Instalação de Certificados Concluída"
}

installCurl() {
  start "Iniciando instalação do Curl Wget"

  echo "sudo apt install curl -y >/dev/null"

  finish "Instalação do Curl Concluída"
}

installGnupgAgent() {
  start "Iniciando instalação do GNUPG Agent"

  echo "sudo apt install gnupg-agent -y >/dev/null"

  finish "Instalação do GNUPG Concluída"
}

installSnap() {
  start "Iniciando instalação do Snap"

  echo "sudo apt install snapd -y >/dev/null"

  finish "Instalação do Snap Concluída"
}

installGit() {
  start "Iniciando instalação do Git"

  echo "sudo apt install git -y >/dev/null"

  finish "Instalação do Git Concluída"
}

installIntellij() {
  start "Iniciando instalação do IntelliJ IDEA"

  echo "sudo add-apt-repository ppa:ubuntuhandbook1/apps"
  echo "sudo apt update -qq"

  echo -e "\n${LIME_YELLOW}Selecione a versão do IntelliJ a ser instalado:"

  options=("Community" "Ultimate" "Quit")

  select opt in "${options[@]}"; do
    case $opt in
    "Community")
      echo "sudo apt-get install intellij-idea-community -y"
      finish "Instalação do IntelliJ IDEA Community Concluída"
      break
      ;;
    "Ultimate")
      echo "sudo apt-get install intellij-idea-ultimate -y"
      finish "Instalação do IntelliJ IDEA Ultimate Concluída"
      break
      ;;
    "Quit")
      echo -e "${RED}[ ✘️ ] Intellij não instalado!"
      break
      ;;
    *) echo -e "${RED}Opção inválida, tente novamente!" ;;
    esac
  done
}

installJdk() {
  start "Iniciando instalação do JDK"

  echo "sudo add-apt-repository ppa:ubuntuhandbook1/apps >/dev/null"

  echo "sudo apt update -qq"

  echo -e "\n${LIME_YELLOW}Selecione a versão do Openjdk a ser instalado:"

  options=("8" "11" "12" "Quit")

  select opt in "${options[@]}"; do
    case $opt in
    "8")
      echo "sudo apt install openjdk-8-jdk -y"
      finish "Instalação do JDK Concluída"
      break
      ;;
    "11")
      echo "sudo apt install openjdk-11-jdk -y"
      finish "Instalação do JDK Concluída"
      break
      ;;
    "12")
      echo "sudo apt install openjdk-12-jdk -y"
      finish "Instalação do JDK Concluída"
      break
      ;;
    "Quit")
      echo -e "${RED}[ ✘️ ] JDK não instalado!"
      break
      ;;
    *) echo -e "${RED}Opção inválida, tente novamente!" ;;
    esac
  done
}

installMaven() {
  start "Iniciando instalação do Maven"

  echo "sudo apt install maven -y"

  finish "Instalação do Maven Concluída"
}

installDocker() {
  start "Adicionando chave GPG oficial do Docker"

  echo "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"

  start "Iniciando instalação do Docker"

  echo "sudo apt-get install docker-ce docker-ce-cli containerd.io"

  finish "Instalação do Docker Concluída"
}

installVsCode() {
  start "Iniciando instalação do Visual Studio Code"

  echo "wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -"
  echo "sudo add-apt-repository deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  echo "sudo apt install code -y"

  echo "sudo apt update -qq"
  echo "sudo apt upgrade -qq"

  finish "Instalação do Visual Studio Code Concluída"
}

installPostaman() {
  start "Iniciando instalação do Postman"

  echo "sudo snap install postman -y >/dev/null"

  finish "Instalação do Postman Concluída"
}

installMySql() {
  start "Iniciando instalação do MySql"

  echo "sudo apt-get install mysql-server mysql-client -y"

  finish "Instalação do MySql Server Concluída"
}

installMySqlWorkbench() {
  start "Iniciando instalação do MySql Workbench"

  echo "sudo apt install mysql-workbench -y>/dev/null"

  finish "Instalação do MySql Workbench Concluída"
}

installChrome() {
  start "Iniciando instalação do Google Chrome"

  echo "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null"
  echo "sudo dpkg -i google-chrome-stable_current_amd64.deb >/dev/null"

  finish "Instalação do Google Chrome Concluída"
}

installSpotify() {
  start "Iniciando instalação do Spotify"

  echo "snap install spotify >/dev/null"

  finish "Instalação do Spotify Concluída"
}

installDiscord() {
  start "Iniciando instalação do Discord"

  echo "sudo snap install discord >/dev/null"

  finish "Instalação do Discord Concluída"
}

start() {
  FRAME=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
  FRAME_INTERVAL=0.1

  # tput civis -- invisible

  while ps -p $pid &>/dev/null; do
    echo -ne "\\r${CYAN}[   ] $1 ..."

    for k in "${!FRAME[@]}"; do
      echo -ne "\\r[ ${FRAME[k]} ]"
      sleep $FRAME_INTERVAL
    done
  done
}

finish() {
  echo -ne "\\r${GREEN}[ ✔ ] $1\\n"

  tput cnorm -- normal
}

finishInstall() {
  echo "sudo apt update -qq"
  echo "sudo apt upgrade -qq"

  ufw enable
  echo "Repositorio Atualizado."
  echo "Sistema Atualizado."
  echo "Programas instalados."
  echo "...................."
  echo Pressione Enter para Continuar
  read #pausa
  exit
}
