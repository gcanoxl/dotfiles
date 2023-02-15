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
antigen theme ys

# z.lua
antigen bundle skywind3000/z.lua

# syntax highlight
antigen bundle zdharma/fast-syntax-highlighting

antigen bundle zsh-users/zsh-autosuggestions

#Apply Antigen
antigen apply

# Using Ctrl - F to accept suggestion.
bindkey '^k' autosuggest-accept


alias nv='nvim'
alias bs='brew search'
alias bif='brew info'
alias bi='brew install'
alias bci='brew install --cask'
alias bu='brew uninstall'
alias bcu='brew uninstall --cask'
alias bl='brew list'
alias bU='brew update && brew upgrade'

alias gs='git status'
alias gc='git clone'
alias gcb='git checkout -b'
alias ga='git add'
alias gal='git add .'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gms='git merge --squash'
alias gcm='git commit -m'
alias gp='git push'

alias em='emacsclient -t -a ""'
alias sem='sudo emacsclient -t -a ""'
