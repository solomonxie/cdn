#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

set -x

# ---SETING UP ZSH ---
echo "-----[  START SETTING UP ZSH   ]-----"
yes | sudo apt-get install zsh


echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "-----[  OVERWRITE ZSHRC   ]-----"
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc-ubuntu -O ~/.zshrc
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc.extension-ubuntu -O ~/.zshrc.extension

echo "---[  Installing Themes for ZSH   ]----"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
yes | pip install -U powerline-status

echo "---[  Installing Themes for ZSH   ]----"
sudo chown -R ubuntu:ubuntu $ZSH_CUSTOM

echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
