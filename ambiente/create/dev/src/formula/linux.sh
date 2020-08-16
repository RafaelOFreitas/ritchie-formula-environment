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
    sayHello

    case $CONFIGURATION in
    "Complete configuration")
        completeConfiguration $GIT_NAME $GIT_EMAIL
        ;;
    "Select programs")
        echo "Select"
        ;;
    *) echo -e "${RED}Invalid option, try again!" ;;
    esac
}

completeConfiguration() {
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
}

sayHello() {
    echo sudo apt install lolcat -y
    echo sudo apt install cowsay -y

    cowsay -f gnu Setting up environment with RITCHIE! 🦸🚀 | lolcat

    printf "\n${GREEN}OS version: %s\n"
    lsb_release -r
}

installSPropertiesCommon() {
    start "Starting installation of Properties Common"

    echo sudo apt install software-properties-common -y >/dev/null

    finish "Properties Common installation complete"
}

installWget() {
    start "Starting installation of GNU Wget"

    checkIfIsInstalled "wget"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  GNU Wget is already installed!"
        return
    fi

    echo sudo apt install apt-transport-https wget -y >/dev/null

    finish "GNU Wget installation completed"
}

installCertificates() {
    start "Starting installation of Certificates"

    echo sudo apt install ca-certificates -y >/dev/null

    finish "Certificate Installation Complete"
}

installCurl() {
    start "Starting installation of Curl Wget"

    checkIfIsInstalled "curl"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Curl is already installed!"
        return
    fi

    echo sudo apt install curl -y >/dev/null

    finish "Curl Installation Complete"
}

installGnupgAgent() {
    start "Starting installation of the GNUPG Agent"

    echo sudo apt install gnupg-agent -y >/dev/null

    finish "GNUPG installation completed"
}

installSnap() {
    start "Starting Snap installation"

    checkIfIsInstalled "snap"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Snap is already installed!"
        return
    fi

    echo sudo apt install snapd -y >/dev/null

    finish "Snap Installation Complete"
}

installJdk() {
    start "Starting JDK installation"

    echo sudo add-apt-repository ppa:ubuntuhandbook1/apps >/dev/null

    echo sudo apt update -qq

    echo -e "\n${LIME_YELLOW}Select the version of Openjdk to be installed:"

    options=("8" "11" "12" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "8")
            echo sudo apt install openjdk-8-jdk -y
            finish "JDK 8 installation completed"
            break
            ;;
        "11")
            echo sudo apt install openjdk-11-jdk -y
            finish "JDK 11 installation completed"
            break
            ;;
        "12")
            echo sudo apt install openjdk-12-jdk -y
            finish "JDK 12 installation completed"
            break
            ;;
        "Quit")
            echo -e "${RED}[ ✘️ ] JDK not installed!"
            break
            ;;
        *) echo -e "${RED}Invalid option, try again!" ;;
        esac
    done
}

installPython() {
    start "Starting Python3 installation"

    checkIfIsInstalled "python3"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Python3 is already installed!"
        return
    fi

    echo sudo add-apt-repository ppa:deadsnakes/ppa
    echo sudo apt install python3.8

    finish "Python3 installation completed"
}

installNode() {
    start "Starting Node installation"

    checkIfIsInstalled "node"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Node is already installed!"
        return
    fi

    echo sudo apt install nodejs

    finish "Node installation complete"
}

installNpm() {
    start "Starting Npm installation"

    checkIfIsInstalled "npm"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Npm is already installed!"
        return
    fi

    echo sudo apt install npm -y

    finish "Npm Installation Complete"
}

installVsCode() {
    start "Starting Visual Studio Code installation"

    checkIfIsInstalled "code"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Visual Studio Code is already installed!"
        return
    fi

    echo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    echo sudo add-apt-repository deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
    echo sudo apt install code -y

    echo sudo apt update -qq
    echo sudo apt upgrade -qq

    finish "Visual Studio Code installation complete"
}

installGit() {
    start "Starting Git installation"

    checkIfIsInstalled "git"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Git is already installed!"
        return
    fi

    echo sudo apt install git -y >/dev/null

    echo git config --global user.name "$1"
    echo git config --global user.email "$2"

    finish "Git installation complete"
}

installMaven() {
    start "Starting Maven installation"

    checkIfIsInstalled "mvn"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Maven is already installed!"
        return
    fi

    echo sudo apt install maven -y

    finish "Installation of Maven Complete"
}

installDocker() {
    start "Starting Docker installation"

    checkIfIsInstalled "docker"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Docker is already installed!"
        return
    fi

    echo sudo apt install docker.io
    echo sudo systemctl start docker
    echo sudo systemctl enable docker

    finish "Docker installation complete"
}

installIntellij() {
    start "Starting installation of IntelliJ IDEA"

    checkIfIsInstalled "idea"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  IntelliJ IDEA is already installed!"
        return
    fi

    echo sudo add-apt-repository ppa:ubuntuhandbook1/apps
    echo sudo apt update -qq

    echo -e "\n${LIME_YELLOW}Select the version of IntelliJ to be installed:"

    options=("Community" "Ultimate" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "Community")
            echo sudo apt-get install intellij-idea-community -y
            finish "IntelliJ IDEA Community installation completed"
            break
            ;;
        "Ultimate")
            echo sudo apt-get install intellij-idea-ultimate -y
            finish "IntelliJ IDEA Ultimate installation completed"
            break
            ;;
        "Quit")
            echo -e "${RED}[ ✘️ ] Intellij not installed!"
            break
            ;;
        *) echo -e "${RED}Invalid option, try again!" ;;
        esac
    done
}

installPostman() {
    start "Starting Postman installation"

    checkIfIsInstalled "postman"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Postman is already installed!"
        return
    fi

    echo sudo snap install postman -y >/dev/null

    finish "Postman installation complete"
}

installMySql() {
    start "Starting MySql installation"

    checkIfIsInstalled "mysql"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  MySql is already installed!"
        return
    fi

    echo sudo apt-get install mysql-server mysql-client -y

    finish "MySql Server installation complete"
}

installMySqlWorkbench() {
    start "Starting installation of MySql Workbench"

    echo sudo apt install mysql-workbench -y >/dev/null

    finish "MySql Workbench Installation Complete"
}

installChrome() {
    start "Starting installation of Google Chrome"

    echo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null
    echo sudo dpkg -i google-chrome-stable_current_amd64.deb >/dev/null

    finish "Google Chrome installation complete"
}

installSpotify() {
    start "Starting Spotify installation"

    checkIfIsInstalled "spotify"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Spotify is already installed!"
        return
    fi

    echo snap install spotify >/dev/null

    finish "Spotify Installation Complete"
}

installDiscord() {
    start "Starting Discord installation"

    checkIfIsInstalled "discord"
    if [ $? -eq 1 ]; then
        echo "${YELLOW}⚠️  Discord is already installed!"
        return
    fi

    echo sudo snap install discord >/dev/null

    finish "Discord Installation Complete"
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
    echo "Installed programs."
    echo "Updated Repository."
    echo "Updated System."
    echo "...................."
    echo Press Enter to Continue
    read #pausa
    exit
}
