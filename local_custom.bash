# bash_it
# alias: clipboard fuck general git npm systemd yarn 
# plugins: alias-completion base explain fzf git node nvm pyenv z                
# complete: bash-it git npm nvm pip3 ssh system  
export VISUAL=nvim
alias vim=nvim
alias vi=nvim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow --glob "!.git/*" --glob "!output/*" --glob "!bower_components/*" --glob "!.psc-package/*" --glob "!node_modules/*"'
alias open=xdg-open
alias remap="xmodmap $HOME/.Xmodmap"
export PATH="$PATH:$HOME/.local/bin"

# Aliases for software managment
# pacman or pm
alias pmsyu="sudo pacman -Syu --color=auto"
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syu'

# pacaur or pc
alias pcsyu="pacaur -Syu"

# yaourt keeps tmp folder cleaner than packer
alias pks="yaourt -S --noconfirm "
alias pksyu="yaourt -Syu --noconfirm"
alias pksyua="yaourt -Syu  --aur --noconfirm"


alias mirror="sudo reflector --protocol https --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist"
alias mirrors=mirror
alias sl="ls"
alias pdw="pwd"
#readable output
alias df='df -h'

neofetch
