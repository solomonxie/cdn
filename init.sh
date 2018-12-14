#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE: 
#   This script shouldn't be run as ROOT user,
#   please don't abuse "sudo" on top of this script.
#   Run this as ROOT results apps installed to wrong paths.
#
# How to run this script:
#   git clone https://github.com/solomonxie/dotfiles.git ~/dotfiles 
#   ~/dotfiles/init.sh
#   #or
#   $ nohup ~/dotfiles/init.sh 2>&1 > /dev/null &
#
# Debugging:
#   $ bashdb ~/dotfiles/init.sh --os ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -xe

# Setup env variables and shared functions
source `dirname $0`/dotfiles.env


#-------------------------------------
#     Initialization Functions
#-------------------------------------

do_init_by_os(){
    # Do different script based on the OS
    case $MYOS in
        ubuntu)
            do_init_ubuntu ;;
        raspbian)
            do_init_rpi ;;
        mac)
            do_init_mac ;;
    esac
}


do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL $REPO_URL//utils.sh -o ~/.bashrc.utils
    #cat ~/.bashrc.utils >> ~/.bash_profile
    #source ~/.bash_profile
    #
    # Change server timezone
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Add cron job to auto update dotfiles
    export EDITOR=$(which vim)
    #echo "$(crontab -l)*/1 * * * * git -C ~/dotfiles pull" | crontab
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update 
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    $SRC/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    $SRC/zsh/install_zsh.sh
    # Setup Python3
    echo "[   SETTING UP PYTHON   ]"
    $SRC/python/install_python.sh
    # Install common used apt packages & clean up
    $SRC/packageManager/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $SRC/docker/install_docker.sh
    $SRC/docker/docker-apps.sh
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo cp ./etc/Rpi/boot/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    #
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_URL//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    #
    # Add cron job to auto update dotfiles
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    #
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    sudo apt-get update 2>&1 /dev/null
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    $SRC/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    $SRC/zsh/install_zsh.sh
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    $SRC/python/install_python3.sh
    # Install common used apt packages & clean up
    $SRC/packageManager/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $SRC/docker/install-docker-rpi.sh
    $SRC/docker/docker-apps.sh
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
    # Homebrew, always the 1st setup for Mac
    sh $SRC/packageManager/homebrew.sh
    # Xcode
    # .... you want to install that in App Store....
    # 
}




#-------------------------------------
#          Entry points
#-------------------------------------

# Run initial functions by os version
do_init_by_os "$@"

