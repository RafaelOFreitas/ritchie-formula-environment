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

runConfigLinux() {
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
        installJdk
        installPython
        installNode
        installNpm
        installVsCode
        installGit $GIT_NAME $GIT_EMAIL
        installMaven
        installDocker
        installIntellij
        installPostman
        installMySql
        installMySqlWorkbench
        installChrome
        installSpotify
        installDiscord

        finishInstall
        ;;
    "Selecionar programas")
        echo "Selecionar"
        ;;
    *) echo -e "${RED}Opção inválida, tente novamente!" ;;
    esac
}

sayHello() {
    echo sudo apt install lolcat -y
    echo sudo apt install cowsay -y

    cowsay -f gnu Configurando ambiente com RITCHIE! 🦸🚀 | lolcat

    printf "\n${GREEN}Versão do SO: %s\n"
    lsb_release -r
}

installSPropertiesCommon() {
    start "Iniciando instalação de Properties Common"

    echo sudo apt install software-properties-common -y >/dev/null

    finish "Instalação de Properties Common Concluída"
}

installWget() {
    start "Iniciando instalação do GNU Wget"

    checkIfIsInstalled "wget"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  GNU Wget já está instalado!"
        return
    fi

    echo sudo apt install apt-transport-https wget -y >/dev/null

    finish "Instalação do GNU Wget Concluída"
}

installCertificates() {
    start "Iniciando instalação de Certificados"

    echo sudo apt install ca-certificates -y >/dev/null

    finish "Instalação de Certificados Concluída"
}

installCurl() {
    start "Iniciando instalação do Curl Wget"

    checkIfIsInstalled "curl"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Curl já está instalado!"
        return
    fi

    echo sudo apt install curl -y >/dev/null

    finish "Instalação do Curl Concluída"
}

installGnupgAgent() {
    start "Iniciando instalação do GNUPG Agent"

    echo sudo apt install gnupg-agent -y >/dev/null

    finish "Instalação do GNUPG Concluída"
}

installSnap() {
    start "Iniciando instalação do Snap"

    checkIfIsInstalled "snap"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Snap já está instalado!"
        return
    fi

    echo sudo apt install snapd -y >/dev/null

    finish "Instalação do Snap Concluída"
}

installJdk() {
    start "Iniciando instalação do JDK"

    echo sudo add-apt-repository ppa:ubuntuhandbook1/apps >/dev/null

    echo sudo apt update -qq

    echo -e "\n${LIME_YELLOW}Selecione a versão do Openjdk a ser instalado:"

    options=("8" "11" "12" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "8")
            echo sudo apt install openjdk-8-jdk -y
            finish "Instalação do JDK Concluída"
            break
            ;;
        "11")
            echo sudo apt install openjdk-11-jdk -y
            finish "Instalação do JDK Concluída"
            break
            ;;
        "12")
            echo sudo apt install openjdk-12-jdk -y
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

installPython() {
    start "Iniciando instalação do Python3"

    checkIfIsInstalled "python3"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Python3 já está instalado!"
        return
    fi

    echo sudo add-apt-repository ppa:deadsnakes/ppa
    echo sudo apt install python3.8

    finish "Instalação do Python3 Concluída"
}

installNode() {
    start "Iniciando instalação do Node"

    checkIfIsInstalled "node"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Node já está instalado!"
        return
    fi

    echo sudo apt install nodejs

    finish "Instalação do Node Concluída"
}

installNpm() {
    start "Iniciando instalação do Npm"

    checkIfIsInstalled "npm"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Npm já está instalado!"
        return
    fi

    echo sudo apt install npm -y

    finish "Instalação do Npm Concluída"
}

installVsCode() {
    start "Iniciando instalação do Visual Studio Code"

    checkIfIsInstalled "code"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Visual Studio Code já está instalado!"
        return
    fi

    echo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    echo sudo add-apt-repository deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
    echo sudo apt install code -y

    echo sudo apt update -qq
    echo sudo apt upgrade -qq

    finish "Instalação do Visual Studio Code Concluída"
}

installGit() {
    start "Iniciando instalação do Git"

    checkIfIsInstalled "git"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Git já está instalado!"
        return
    fi

    echo sudo apt install git -y >/dev/null

    echo git config --global user.name "$1"
    echo git config --global user.email "$2"

    finish "Instalação do Git Concluída"
}

installMaven() {
    start "Iniciando instalação do Maven"

    checkIfIsInstalled "mvn"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Maven já está instalado!"
        return
    fi

    echo sudo apt install maven -y

    finish "Instalação do Maven Concluída"
}

installDocker() {
    start "Adicionando chave GPG oficial do Docker"

    checkIfIsInstalled "docker"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Docker já está instalado!"
        return
    fi

    start "Iniciando instalação do Docker"

    echo sudo apt install docker.io
    echo sudo systemctl start docker
    echo sudo systemctl enable docker

    finish "Instalação do Docker Concluída"
}

installIntellij() {
    start "Iniciando instalação do IntelliJ IDEA"

    echo sudo add-apt-repository ppa:ubuntuhandbook1/apps
    echo sudo apt update -qq

    echo -e "\n${LIME_YELLOW}Selecione a versão do IntelliJ a ser instalado:"

    options=("Community" "Ultimate" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "Community")
            echo sudo apt-get install intellij-idea-community -y
            finish "Instalação do IntelliJ IDEA Community Concluída"
            break
            ;;
        "Ultimate")
            echo sudo apt-get install intellij-idea-ultimate -y
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

installPostman() {
    start "Iniciando instalação do Postman"

    checkIfIsInstalled "postman"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Postman já está instalado!"
        return
    fi

    echo sudo snap install postman -y >/dev/null

    finish "Instalação do Postman Concluída"
}

installMySql() {
    start "Iniciando instalação do MySql"

    checkIfIsInstalled "mysql"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  MySql já está instalado!"
        return
    fi

    echo sudo apt-get install mysql-server mysql-client -y

    finish "Instalação do MySql Server Concluída"
}

installMySqlWorkbench() {
    start "Iniciando instalação do MySql Workbench"

    echo sudo apt install mysql-workbench -y >/dev/null

    finish "Instalação do MySql Workbench Concluída"
}

installChrome() {
    start "Iniciando instalação do Google Chrome"

    echo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null
    echo sudo dpkg -i google-chrome-stable_current_amd64.deb >/dev/null

    finish "Instalação do Google Chrome Concluída"
}

installSpotify() {
    start "Iniciando instalação do Spotify"

    checkIfIsInstalled "spotify"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Spotify já está instalado!"
        return
    fi

    echo snap install spotify >/dev/null

    finish "Instalação do Spotify Concluída"
}

installDiscord() {
    start "Iniciando instalação do Discord"

    checkIfIsInstalled "discord"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Discord já está instalado!"
        return
    fi

    echo sudo snap install discord >/dev/null

    finish "Instalação do Discord Concluída"
}

checkIfIsInstalled() {
    if ! command -v $1 >/dev/null; then
        return 0
    else
        return 1
    fi
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
    echo sudo apt update -qq
    echo sudo apt upgrade -qq

    echo sudo ufw enable
    echo "Repositorio Atualizado."
    echo "Sistema Atualizado."
    echo "Programas instalados."
    echo "...................."
    echo Pressione Enter para Continuar
    read #pausa
    exit
}
