#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Commands:
#   1. Get in VIM
#   2. :Pluginstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :Pluginstall
#
# Run:
#   $ ./install_vim.sh --os ubuntu
# Debug:
#   $ bashdb ./install_vim.sh --os ubuntu


set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_vim(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_vim_ubuntu ;;
        raspbian)
            install_vim_rpi ;;
        mac)
            install_vim_mac ;;
    esac

    # Make paths for vim extensions
    mkdir -p $HOUSE/.vim

    # Color Scheme
    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    rm $HOUSE/.vim/colors /dev/null 2>&1
    ln -s $HOUSE/dotfiles/vim/colors $HOUSE/.vim/colors
    #mkdir -p $HOUSE/.vim/colors
    #cp $SRC/vim/colors/gruvbox.vim $HOUSE/.vim/colors/gruvbox.vim

    # Syntax files
    echo "-----[  INSTALLING VIM SYNTAX  ]-----"
    mkdir -p $HOUSE/.vim/syntax
    cp $SRC/vim/syntax/python.vim $HOUSE/.vim/syntax/python.vim

    # Download Vundle & Install plugins
    echo "-----[  DOWNLOADING VIM PLUGIN MANAGER   ]-----"
    curl -fLo $HOUSE/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
}

install_vim_ubuntu(){
    sudo apt-get install vim -y

    # Plugin dependencies
    sudo apt-get install ctags -y

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu $HOUSE/.vim
    # sudo chown -R ubuntu $HOUSE/.vim >> $HOUSE/.init/log_vim.txt 1>&2

    echo "-----[   Link VIMRC   ]-----"
    ln -sf $HOUSE/dotfiles/vim/vimrc $HOUSE/.vimrc
}

install_vim_rpi(){
    yes | sudo apt-get install vim

    # Plugin dependencies
    sudo apt-get install ctags -y

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi $HOUSE/.vim
    #sudo chown -R ubuntu $HOUSE/.vim >> $HOUSE/.init/log_vim.txt 1>&2

    echo "-----[   Link VIMRC   ]-----"
    ln -sf $HOUSE/dotfiles/vim/vimrc-mini $HOUSE/.vimrc
}

install_vim_mac(){
    brew install vim

    # Install plugin dependencies
    brew install ctags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags

    echo "-----[   Link VIMRC   ]-----"
    ln -sf $HOUSE/dotfiles/vim/vimrc $HOUSE/.vimrc
}

build_vim_pi(){
    # Download
    cd /tmp
    wget https://github.com/vim/vim/archive/v8.1.0561.tar.gz
    tar -xzvf v8.1.0561.tar.gz
    cd vim-8.1.0561

    # Install / Download Language support libraries
    sudo apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

    # Fix python paths
    sudo ln -s /usr/lib/python2.7/config-arm-linux-gnueabihf /usr/lib/python2.7/config
    sudo ln -s /usr/lib/python3.4/config-3.4m-arm-linux-gnueabihf /usr/lib/python3.4/config

    # Get language support paths
    # For Mac
    #py2="/usr/lib/python2.7/config"
    #py3="/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/config-3.7m-darwin"
    #lua="/usr/local/Cellar/lua/5.3.5_1"
    # For Rpi
    #py2="/usr/lib/python2.7/config-arm-linux-gnueabihf"
    #py3="/usr/lib/python3.4/config-3.4m-arm-linux-gnueabihf"
    #lua="/usr/lib"

    # Build
    ./configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python3.4/config \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/opt/vim-8.1 && \
        echo '[ OK ]'

    make && sudo make install && echo '[ OK ]'

    # Replace VIM in old version with new
    sudo mv $(which vim) "$(which vim)_old"
    sudo ln -s /opt/vim-8.1/bin/vim /usr/bin/vim
}


build_vim_ubuntu(){
    # Download
    cd /tmp
    wget https://github.com/vim/vim/archive/v8.1.0561.tar.gz
    tar -xzvf v8.1.0561.tar.gz
    cd vim-8.1.0561

    # Install / Download Language support libraries
    sudo apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

    # Fix python paths
    sudo ln -s /usr/lib/python2.7/config-x86_64-linux-gnu /usr/lib/python2.7/config
    sudo ln -s /usr/lib/python3.5/config-3.5m-x86_64-linux-gnu /usr/lib/python3.5/config

    # Get language support paths
    # For Mac
    #py2="/usr/lib/python2.7/config"
    #py3="/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/config-3.7m-darwin"
    #lua="/usr/local/Cellar/lua/5.3.5_1"
    # For Rpi
    #py2="/usr/lib/python2.7/config-arm-linux-gnueabihf"
    #py3="/usr/lib/python3.4/config-3.4m-arm-linux-gnueabihf"
    #lua="/usr/lib"

    # Build
    ./configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python3.5/config \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/opt/vim-8.1 && \
        echo '[ OK ]'

    make && sudo make install && echo '[ OK ]'

    # Replace VIM in old version with new
    sudo mv $(which vim) "$(which vim)_old"
    sudo ln -s /opt/vim-8.1/bin/vim /usr/bin/vim
}


install_vim_plugin_deoplete_deb(){
    # Install pip2 & pip3
    sudo apt-get install -y python-pip python3-pip
    # Install dependencies
    pip2 install --user pynvim
    pip3 install --user pynvim
    pip2 install --user neovim
    pip3 install --user neovim
}

install_vim_plugin_deoplete_mac(){
    # Install pip2 & pip3
    brew install python@2
    brew reinstall python@2
    # Install dependencies
    pip2 install --user pynvim
    pip3 install --user pynvim
    pip2 install --user neovim
    pip3 install --user neovim
}



#-------------------------------------
#          Entry points
#-------------------------------------

do_install_vim "$@"
