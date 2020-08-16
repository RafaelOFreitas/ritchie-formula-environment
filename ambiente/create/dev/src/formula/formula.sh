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
    installWget
    installSnap
    installChrome
    installSpotify
    installDiscord
    installVsCode
    installJdk
    installGit
    installIntellij
    installPostaman
    installMySql
    installMySqlWorkbench
    ;;
  "Selecionar programas")
    echo "Selecionar"
    ;;
  *) echo -e "${RED}Opção inválida, tente novamente!" ;;
  esac
}

sayHello() {
  echo "sudo apt install lolcat"
  echo "sudo apt install cowsay"

  cowsay -f gnu Configurando ambiente com RITCHIE! 🦸🚀 | lolcat

  printf "\n${GREEN}Versão do SO: %s\n"
  lsb_release -r
}

installWget() {
  start "Iniciando instalação do GNU Wget"

  echo "sudo apt install software-properties-common apt-transport-https wget >/dev/null"

  finish "Instalação do GNU Wget Concluída"
}

installSnap() {
  start "Iniciando instalação do Snap"

  echo "sudo apt install snapd >/dev/null"

  finish "Instalação do Snap Concluída"
}

installGit() {
  start "Iniciando instalação do Git"

  echo "sudo apt update -qq"
  echo "sudo apt install git >/dev/null"

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
      echo "sudo apt-get install intellij-idea-community"
      finish "Instalação do IntelliJ IDEA Community Concluída"
      break
      ;;
    "Ultimate")
      echo "sudo apt-get install intellij-idea-ultimate"
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
      echo "sudo apt install openjdk-8-jdk"
      finish "Instalação do JDK Concluída"
      break
      ;;
    "11")
      echo "sudo apt install openjdk-11-jdk"
      finish "Instalação do JDK Concluída"
      break
      ;;
    "12")
      echo "sudo apt install openjdk-12-jdk"
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

installVsCode() {
  start "Iniciando instalação do Visual Studio Code"

  echo "wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -"
  echo "sudo add-apt-repository deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  echo "sudo apt install code"

  echo "sudo apt update -qq"
  echo "sudo apt upgrade -qq"

  finish "Instalação do Visual Studio Code Concluída"
}

installPostaman() {
  start "Iniciando instalação do Postman"

  echo "sudo snap install postman >/dev/null"

  finish "Instalação do Postman Concluída"
}

installMySql() {
  start "Iniciando instalação do MySql"

  echo "sudo apt-get install mysql-server mysql-client"

  echo "sudo apt update -qq"

  finish "Instalação do MySql Server Concluída"
}

installMySqlWorkbench() {
  start "Iniciando instalação do MySql Workbench"

  echo "sudo apt install mysql-workbench >/dev/null"

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
