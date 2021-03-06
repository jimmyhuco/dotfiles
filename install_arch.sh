#!/bin/sh

dir=`dirname "$0"`
pwd=`cd "$dir" > /dev/null 2>&1 && pwd`

# BEFOR TODO Chnage pacman mirror

sudo pacman -Syu
sudo pacman -S --noconfirm base-devel btrfs-progs intel-ucode zsh wget curl git # Base
sudo pacman -S --noconfirm xorg-server lightdm lightdm-gtk-greeter bumblebee mesa nvidia # Display Manager
sudo pacman -S --noconfirm xmonad xmonad-contrib xmobar xorg-xrdb xorg-xmodmap xorg-xdpyinfo xorg-xsetroot feh dmenu rxvt-unicode dzen2 conky # Window Manager
sudo pacman -S --noconfirm adobe-source-code-pro-fonts ttf-liberation ttf-hack ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-han-sans-tw-fonts ttf-dejavu ttf-arphic-ukai ttf-arphic-uming opendesktop-fonts wqy-microhei wqy-zenhei wqy-bitmapfont # Fonts
sudo pacman -S --noconfirm vim emacs ibus-rime ripgrep thefuck bind-tools netstat-nat pandoc chromium pepper-flash shadowsocks-libev libsodium htop tree glances scdv tlp tlp-rdw thermald smartmontools snapper xclip # Tools


# Enable system services
sudo systemctl enable sshd.service
sudo cp xmonad.desktop /usr/share/xsessions/
sudo systemctl enable lightdm.service
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl mask NetworkManager.service

chsh -s /usr/bin/zsh

# AFTER TODO
# add user and login with the use account
# install aura (git clone https://aur.archlinux.org/aura.git)
# sudo aura -Akua ttf-iosevka-haskell
# sudo aura -Akua fzf-git 
# sudo aura -Akua lightdm-webkit2-greeter
# sudo aura -S xorg-xbacklight
# isntall hardware relative drivers
# install cabal
# install stack
# install nvm
# install pyenv
# install rbenv
# install thefuck
# check your dirver lspci -k | grep -A 2 -E "(VGA|3D)"
# gpasswd -a jimmy bumblebee
# sudo gpasswd -a jimmy bumblebee
# sudo systemctl enable bumblebeed.service

