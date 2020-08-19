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
    sayHello $SYSTEM

    case $CONFIGURATION in
    "Complete configuration")
        completeConfiguration $GIT_NAME $GIT_EMAIL
        ;;
    "Select programs")
        selectConfiguration $GIT_NAME $GIT_EMAIL
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

selectConfiguration() {
    start "Starting manual installation"

    echo -e "\n${YELLOW}Select the tool you want to install:"

    selections=(
        "Properties Common"
        "Wget"
        "Curl"
        "Gnupg Agent"
        "Snap"
        "Jdk"
        "Python"
        "Node"
        "Npm"
        "VsCode"
        "Git"
        "Maven"
        "Docker"
        "Intellij"
        "Postman"
        "MySql"
        "MySql Workbench"
        "Chrome"
        "Spotify"
        "Discord"
        "Quit"
    )

    while opt=$(zenity --title="$title" --text="$prompt" --list \
        --column="Tools" "${selections[@]}"); do

        case "$opt" in
        "${selections[0]}") installSPropertiesCommon ;;
        "${selections[1]}") installWget ;;
        "${selections[2]}") installCurl ;;
        "${selections[3]}") installGnupgAgent ;;
        "${selections[4]}") installSnap ;;
        "${selections[5]}") installJdk ;;
        "${selections[6]}") installPython ;;
        "${selections[7]}") installNode ;;
        "${selections[8]}") installNpm ;;
        "${selections[9]}") installVsCode ;;
        "${selections[10]}") installGit $GIT_NAME $GIT_EMAIL ;;
        "${selections[11]}") installMaven ;;
        "${selections[12]}") installDocker ;;
        "${selections[13]}") installIntellij ;;
        "${selections[14]}") installPostman ;;
        "${selections[15]}") installMySql ;;
        "${selections[16]}") installMySqlWorkbench ;;
        "${selections[17]}") installChrome ;;
        "${selections[18]}") installSpotify ;;
        "${selections[19]}") installDiscord ;;
        "${selections[20]}") break ;;
        *) zenity --error --text="Invalid option. Try another one." ;;
        esac

    done

    finishInstall
}

sayHello() {
    sudo apt-get install lolcat >/dev/null
    sudo apt-get install cowsay >/dev/null

    cowsay -f gnu Setting up environment $1 with RITCHIE! 🦸🚀 | lolcat

    printf "\n${CYAN}OS version: %s"
    lsb_release -r
}

installSPropertiesCommon() {
    start "Starting installation of Properties Common"

    sudo apt-get install software-properties-common >/dev/null

    finish "Properties Common installation complete"
}

installWget() {
    start "Starting installation of GNU Wget"

    checkIfIsInstalled "wget"
    if [ $? -eq 1 ]; then
        information "GNU Wget is already installed!"
        return
    fi

    sudo apt-get install apt-transport-https wget >/dev/null

    finish "GNU Wget installation completed"
}

installCertificates() {
    start "Starting installation of Certificates"

    sudo apt-get install ca-certificates >/dev/null

    finish "Certificate Installation Complete"
}

installCurl() {
    start "Starting installation of Curl Wget"

    checkIfIsInstalled "curl"
    if [ $? -eq 1 ]; then
        information "Curl is already installed!"
        return
    fi

    sudo apt-get install curl >/dev/null

    finish "Curl Installation Complete"
}

installGnupgAgent() {
    start "Starting installation of the GNUPG Agent"

    sudo apt-get install gnupg-agent >/dev/null

    finish "GNUPG installation completed"
}

installSnap() {
    start "Starting Snap installation"

    checkIfIsInstalled "snap"
    if [ $? -eq 1 ]; then
        information "Snap is already installed!"
        return
    fi

    sudo apt-get install snapd >/dev/null

    finish "Snap Installation Complete"
}

installJdk() {
    start "Starting JDK installation"

    sudo add-apt-repository ppa:ubuntuhandbook1/apps >/dev/null

    sudo apt-get update -qq >/dev/null

    echo -e "\n${YELLOW}Select the version of Openjdk to be installed:"

    options=("8" "11" "12" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "8")
            sudo apt-get install openjdk-8-jdk >/dev/null
            finish "JDK 8 installation completed"
            break
            ;;
        "11")
            sudo apt-get install openjdk-11-jdk >/dev/null
            finish "JDK 11 installation completed"
            break
            ;;
        "12")
            sudo apt-get install openjdk-12-jdk >/dev/null
            finish "JDK 12 installation completed"
            break
            ;;
        "Quit")
            echo -e "\n${RED}[ ❌ ] JDK not installed!"
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
        information "Python3 is already installed!"
        return
    fi

    sudo add-apt-repository ppa:deadsnakes/ppa >/dev/null
    sudo apt-get install python3.8 >/dev/null

    finish "Python3 installation completed"
}

installNode() {
    start "Starting Node installation"

    checkIfIsInstalled "node"
    if [ $? -eq 1 ]; then
        information "Node is already installed!"
        return
    fi

    sudo apt-get install nodejs >/dev/null

    finish "Node installation complete"
}

installNpm() {
    start "Starting Npm installation"

    checkIfIsInstalled "npm"
    if [ $? -eq 1 ]; then
        information "Npm is already installed!"
        return
    fi

    sudo apt-get install npm >/dev/null

    finish "Npm Installation Complete"
}

installVsCode() {
    start "Starting Visual Studio Code installation"

    checkIfIsInstalled "code"
    if [ $? -eq 1 ]; then
        information "Visual Studio Code is already installed!"
        return
    fi

    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - >/dev/null
    sudo add-apt-repository deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main >/dev/null
    sudo apt-get install code -y

    sudo apt-get update -qq >/dev/null
    sudo apt-get upgrade -qq >/dev/null

    finish "Visual Studio Code installation complete"
}

installGit() {
    start "Starting Git installation"

    checkIfIsInstalled "git"
    if [ $? -eq 1 ]; then
        information "Git is already installed!"
        return
    fi

    sudo apt-get install git >/dev/null

    git config --global user.name "$1"
    git config --global user.email "$2"

    finish "Git installation complete"
}

installMaven() {
    start "Starting Maven installation"

    checkIfIsInstalled "mvn"
    if [ $? -eq 1 ]; then
        information "Maven is already installed!"
        return
    fi

    sudo apt-get install maven >/dev/null

    finish "Installation of Maven Complete"
}

installDocker() {
    start "Starting Docker installation"

    checkIfIsInstalled "docker"
    if [ $? -eq 1 ]; then
        information "Docker is already installed!"
        return
    fi

    sudo apt-get install docker.io >/dev/null
    sudo systemctl start docker >/dev/null
    sudo systemctl enable docker >/dev/null

    finish "Docker installation complete"
}

installIntellij() {
    start "Starting installation of IntelliJ IDEA"

    checkIfIsInstalled "idea"
    if [ $? -eq 1 ]; then
        information "IntelliJ IDEA is already installed!"
        return
    fi

    sudo add-apt-repository ppa:ubuntuhandbook1/apps >/dev/null
    sudo apt-get update -qq >/dev/null

    echo -e "\n${YELLOW}Select the version of IntelliJ to be installed:"

    options=("Community" "Ultimate" "Quit")

    select opt in "${options[@]}"; do
        case $opt in
        "Community")
            sudo apt-get install intellij-idea-community >/dev/null
            finish "IntelliJ IDEA Community installation completed"
            break
            ;;
        "Ultimate")
            sudo apt-get install intellij-idea-ultimate >/dev/null
            finish "IntelliJ IDEA Ultimate installation completed"
            break
            ;;
        "Quit")
            echo -e "${RED}[ ❌ ] Intellij not installed!"
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
        information "Postman is already installed!"
        return
    fi

    sudo snap install postman >/dev/null

    finish "Postman installation complete"
}

installMySql() {
    start "Starting MySql installation"

    checkIfIsInstalled "mysql"
    if [ $? -eq 1 ]; then
        information "MySql is already installed!"
        return
    fi

    sudo apt-get install mysql-server mysql-client >/dev/null

    finish "MySql Server installation complete"
}

installMySqlWorkbench() {
    start "Starting installation of MySql Workbench"

    sudo apt-get install mysql-workbench -y >/dev/null

    finish "MySql Workbench Installation Complete"
}

installChrome() {
    start "Starting installation of Google Chrome"

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null
    sudo dpkg -i google-chrome-stable_current_amd64.deb >/dev/null

    finish "Google Chrome installation complete"
}

installSpotify() {
    start "Starting Spotify installation"

    checkIfIsInstalled "spotify"
    if [ $? -eq 1 ]; then
        information "Spotify is already installed!"
        return
    fi

    snap install spotify >/dev/null

    finish "Spotify Installation Complete"
}

installDiscord() {
    start "Starting Discord installation"

    checkIfIsInstalled "discord"
    if [ $? -eq 1 ]; then
        information "Discord is already installed!"
        return
    fi

    sudo snap install discord >/dev/null

    finish "Discord Installation Complete"
}

checkIfIsInstalled() {
    if ! command -v $1 >/dev/null; then
        return 0
    else
        return 1
    fi
}

information() {
    printf "\n${LIME_YELLOW}[ ⚠️  ] $1"
}

start() {
    FRAME=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    FRAME_INTERVAL=0.1

    # tput civis -- invisible

    while ps -p $pid &>/dev/null; do
        echo -ne "\\r\n${CYAN}[   ] $1 ..."

        for k in "${!FRAME[@]}"; do
            echo -ne "\\r[ ${FRAME[k]} ]"
            sleep $FRAME_INTERVAL
        done
    done
}

finish() {
    echo -ne "\\r\n${GREEN}[ ✅ ] $1"

    tput cnorm -- normal
}

finishInstall() {
    sudo apt update -qq
    sudo apt upgrade -qq

    sudo ufw enable
    echo -ne "\\r\nInstalled programs.\n"
    echo "Updated Repository."
    echo "Updated System."
    echo "...................."
    echo Press Enter to Continue
    read #pausa
    exit
}
