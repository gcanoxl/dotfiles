BIN_DIR="$HOME/.local/bin/"
# Install antigen.zsh if not exist
ANTIGEN="${BIN_DIR}antigen.zsh"
if [ ! -f "$ANTIGEN" ]; then
    echo "Installing antigen ..."
    [ ! -d "$BIN_DIR" ] && mkdir -p "$BIN_DIR" 2> /dev/null
    if [ -x "$(which curl)" ]; then
        curl -L git.io/antigen > "$ANTIGEN"
    fi
fi
# Initialize antigen
source "$ANTIGEN"

antigen use oh-my-zsh
# antigen theme ys
antigen theme robbyrussell

# syntax highlight
antigen bundle zdharma/fast-syntax-highlighting

antigen bundle zsh-users/zsh-autosuggestions

#Apply Antigen
antigen apply

# Using Ctrl - F to accept suggestion.
bindkey '^k' autosuggest-accept



# neovim alias
alias nv='nvim'
alias np='nvim --cmd "set rtp+=."'
# launch neovim with the variable $APP_NAME is set to canvim
alias nc='NVIM_APPNAME=canvim nvim'
alias cnv='NVIM_APPNAME=cleanvim nvim'
alias lv='NVIM_APPNAME=lazy nvim'

# brew alias
alias bs='brew search'
alias bif='brew info'
alias bi='brew install'
alias bci='brew install --cask'
alias bu='brew uninstall'
alias bcu='brew uninstall --cask'
alias bl='brew list'
alias bU='brew update && brew upgrade'

# git alias
alias gs='git status'
alias gc='git clone'
alias gw='git switch'
alias gwc='git switch -c'
alias ga='git add'
alias gal='git add .'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gm='git merge'
alias gcm='git commit -m'
alias gp='git push'

# emacs alias
alias em='emacsclient -t -a ""'
alias sem='sudo emacsclient -t -a ""'

# flutter alias
alias fc='flutter create'
alias fa='flutter pub add'
alias fad='flutter pub add -dev'
alias fg='flutter pub get'
alias fadd='flutter pub add freezed_annotation dev:freezed riverpod_annotation flutter_riverpod dev:riverpod_generator dev:build_runner'

eval "$(zoxide init --cmd cd zsh)"
