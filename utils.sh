#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS

get_distro(){
    local distro=""
    if [ -x "$(command -v lsb_release)" ]; then #Linux
        distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
    elif [ -x "$(command -v sw_vers)" ]; then #MacOS
        distro=$(sw_vers -productName)
    elif [ -x "$(command -v uname)" ]; then #Others
        local info=$(uname -a | tr '[:upper:]' '[:lower:]')
        if [[ $info == *"Darwin"* ]]; then
            distro="darwin"
        elif [[ $info == *"Ubuntu"* ]]; then
            distro="ubuntu"
        elif [[ $info == *"raspberrypi"* ]]; then
            distro="raspbian"
        elif [[ $info == *"Linux"* ]]; then
            distro="linux"
        else
            distro="OTHERS"
        fi
    fi
    echo $distro
}

get_os(){
    case $(get_distro) in
        "darwin" | "Mac OS X")
            echo "CURRENT OS: [  Mac OS X  ].";;
        "ubuntu")
            echo "CURRENT Linux Distribution: [  Ubuntu  ].";;
        "raspbian")
            echo "CURRENT Linux Distribution: [  Raspbian  ].";;
    esac
}