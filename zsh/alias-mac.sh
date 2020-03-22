##################################################
#                 _    _ _                       #
#                / \  | (_) __ _ ___             #
#               / _ \ | | |/ _` / __|            #
#              / ___ \| | | (_| \__ \            #
#             /_/   \_\_|_|\__,_|___/            #
#                                                #
##################################################
# MAINTAINER: Solomon Xie <solomonxiewise@gmail> #
##################################################

#######################################################################
#                            FOR BUILT-IN                             #
#######################################################################
alias lah="ls -lah"
alias please="sudo"


#######################################################################
#                                 Vim                                 #
#######################################################################
alias vim="nvim"
alias vi="vi --noplugin"
alias rec="asciinema rec"
alias m="macdown"


#######################################################################
#                             Bulk Edits                              #
#######################################################################
alias zshrc="vim -S ~/dotfiles/vim/sessions/zsh.vim"
# alias zshrc0="vim ~/.zshrc"
# alias zshrc2="vim ~/dotfiles/zsh/alias-mac.sh"
# alias zshrc3="vim ~/dotfiles/zsh/themes.sh"
# alias vimrc="vim ~/dotfiles/vim/vimrc.vim"
alias vimrc="vim -S ~/dotfiles/vim/sessions/vimrc.vim"
#alias vimrc2="vim ~/dotfiles/vim/vimrc-plugins"
#alias vimrc3="vim ~/dotfiles/vim/vimrc-keymappings"
#alias vimrc4="vim ~/dotfiles/vim/vimrc-ui"
#alias nvimrc="vim ~/dotfiles/vim/init.vim"
# alias nvimrc="vim -S ~/dotfiles/vim/sessions/vimrc.vim"
alias tmuxrc="vim ~/dotfiles/tmux/tmux.conf"
alias bashrc="vim ~/.bashrc"
alias gitrc0="vim ~/.gitconfig"
alias gitrc="vim ~/dotfiles/etc/git/gitconfig.ini"
alias gitrc_="vim ./.git/config"
alias rangerrc="vim ~/.config/ranger/rc.conf"
#alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias muttrc="vim -S ~/dotfiles/vim/sessions/muttrc.vim"
alias tigrc="vim ~/.tigrc"
# alias vimchanges="vim $(git status --porcelain | awk '{print $2}')"
alias snippets="vim -S ~/dotfiles/vim/sessions/snippets.vim "


#######################################################################
#                               NETWORK                               #
#######################################################################
alias proxy='export all_proxy=http://127.0.0.1:1060'
alias unproxy='unset all_proxy'
alias myip="curl https://ip.cn"
alias hosts='sudo vim /etc/hosts'
function sslo() {
    pkill ss-local
    nohup ss-local -c $1 -v 1> /tmp/ssclient.log 2> /tmp/ssclient-err.log &
}

#alias you="youtube-dl -civw --proxy "socks5://127.0.0.1:1086" -f best/mp4 --write-sub "
alias you="youtube-dl"
alias yourc="vim ~/.config/youtube-dl/config"
#alias fzf="~/.fzf/bin/fzf --height 40%"
#alias vfzf="vim $(fzf)"
#alias dfzf="cd $(sh 'find * -type d | fzf')"


#######################################################################
#                                 GIT                                 #
#######################################################################
alias gs="git status"
alias gc="git add .; git commit"
# alias gd="git diff --word-diff=plain"
alias gd="git diff"
alias gco="git checkout"
alias gsc="git sync"
alias gcp="git add .; git quickcommit; git pub"
alias gcl="git clone"
alias diff=vimdiff


#######################################################################
#                               DOCKER                                #
#######################################################################
alias gitbook='docker run -it --name gitbook --rm -v "$PWD":/gitbook -p 4000:4000 billryan/gitbook gitbook'


#######################################################################
#                               PYTHON                                #
#######################################################################
alias venv2="source ~/virtualenv/venv2/bin/activate"
alias venv3="source ~/virtualenv/venv3/bin/activate"
alias venv-ju="source ~/virtualenv/venv-ju/bin/activate"
alias venv-nvim="source ~/virtualenv/venv-ju/bin/activate"
alias ju="jupyter notebook"
alias ipy="ipython"

#######################################################################
#                          MAC APPLICATIONS                           #
#######################################################################
# alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# alias vsc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias sub="open -a 'Sublime Text'"
alias code="open -a 'Visual Studio Code'"
alias typora="open -a 'Typora'"
alias chrome="open -a Google\ Chrome"
alias safari="open -a Safari"
# alias brew="HOMEBREW_NO_AUTO_UPDATE=1 brew"


#######################################################################
#                         CLI TOOLS/COMMANDS                          #
#######################################################################
# PostgreSQL clients
if [ -x $(command -v pgcli) ]; then
    alias psql="$(command -v pgcli)"
elif [ -x /Applications/Postgres.app/Contents/Versions/latest/bin/psql ];then
    alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
fi

# Tmux
#alias tmux="TERM=screen-256color-bce tmux"
alias pname="printf '\033]2;%s\033\\'"  # Set Tmux Pane title
# Please do not Overwite the `title` command/function
