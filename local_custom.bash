# bash_it
# alias: clipboard fuck general git npm systemd yarn 
# plugins: alias-completion base explain fzf git node nvm pyenv z                
# # complete: bash-it git npm nvm pip3 ssh system  
export VISUAL=nvim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow --glob "!.git/*" --glob "!output/*" --glob "!bower_components/*" --glob "!.psc-package/*" --glob "!node_modules/*"'
export PATH="$PATH:$HOME/.local/bin"
export PATH=~/.rakudobrew/bin:$PATH

alias pdf="zathura --fork"
alias vim=nvim
alias vi=nvim
alias open=xdg-open
alias remap="xmodmap $HOME/.Xmodmap"
alias night="pgrep redshift || (redshift > /dev/null 2>&1 &)"

# Temporary fix lede bug
alias et256="export TERM=xterm-256color"

alias dict="ydcv"

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
alias df="df -h"

# Opens the github page for the current git repository in your browser
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
 
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl
}

neofetch
