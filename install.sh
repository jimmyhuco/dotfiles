# Symlinking
ln -fvs ~/Codes/dotfiles/.zshrc ~/.zshrc
ln -fvs ~/Codes/dotfiles/.zshenv ~/.zshenv
ln -fvs ~/Codes/dotfiles/.aliases ~/.aliases
ln -fvs ~/Codes/dotfiles/.exports ~/.exports
ln -fvs ~/Codes/dotfiles/.functions ~/.functions
ln -fvs ~/Codes/dotfiles/.Xdefaults ~/.Xdefaults
ln -fvs ~/Codes/dotfiles/.gitconfig ~/.gitconfig
ln -fvs ~/Codes/dotfiles/.xmonad ~/.xmonad
ln -fvs ~/Codes/dotfiles/.xmobarrc ~/.xmobarrc
ln -fvs ~/Codes/dotfiles/.spacemacs ~/.spacemacs
# Install Spacemacs
git clone https://github.com/syl20bnr/spacemacs -b develop ~/.emacs.d

# exec xmonad --recompile
# exec xmonad --restart

echo "All set."
