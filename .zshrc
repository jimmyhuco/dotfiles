source ~/Codes/dotfiles/antigen/antigen.zsh

for file in ~/.{aliases,exports,extras,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# typeset -U path
path=(~/bin ~/.local/bin $path)
export PATH
#export TERM=xterm-256color

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle cabal
antigen bundle stack
antigen bundle nvm
antigen bundle pyenv
antigen bundle rbenv
antigen bundle emacs
antigen bundle thefuck
antigen bundle z
antigen bundle web-search
antigen bundle extract
#antigen bundle ssh-agent
antigen bundle zsh_reload

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
