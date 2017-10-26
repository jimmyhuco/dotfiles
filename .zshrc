source ~/Codes/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle cabal
antigen bundle stack
antigen bundle nvm
antigen bundle vim-interaction
#antigen bundle pyenv
#antigen bundle rbenv
#antigen bundle emacs
#antigen bundle thefuck
antigen bundle z
antigen bundle web-search
antigen bundle extract
antigen bundle bower
antigen bundle ssh-agent
antigen bundle zsh_reload


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme ys
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply


for file in ~/.{aliases,exports,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

#neofetch
