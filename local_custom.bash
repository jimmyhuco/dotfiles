# bash_it
# alias: clipboard fuck general git npm systemd yarn 
# plugins: alias-completion base explain fzf git node nvm pyenv z                
# complete: bash-it git npm nvm pip3 ssh system  
export VISUAL=nvim
alias vim=nvim
alias vi=nvim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow --glob "!.git/*" --glob "!output/*" --glob "!bower_components/*" --glob "!.psc-package/*"'
alias open=xdg-open
alias pkg=eopkg
alias pkgup="sudo eopkg up"
alias pkgi="sudo eopkg it"
alias remap="xmodmap $HOME/.Xmodmap"
export PATH="$PATH:$HOME/.local/bin"
