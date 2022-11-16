# ohmyzsh
export ZSH="$HOME/.oh-my-zsh"

#GOPATH
export GOPATH=$HOME/go

# homebrew
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export ES_JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk/Contents/Home

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lambda"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# ALIASES
alias ..='cd ..'
alias link='ln -s'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown now'
alias update='brew update'
alias upgrade='brew upgrade'
alias zshrc='vim ~/.zshrc'

# PERMISSIONS
alias privatize="sudo chmod 600"
alias publicize="sudo chmod 777"