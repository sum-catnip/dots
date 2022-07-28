#!/bin/bash

mkdir -p ~/repos
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed git base-devel reflector stow neovim fish otf-hermit

# installing yay
git clone https://aur.archlinux.org/yay.git ~/repos/yay
pushd ~/repos/yay
cd ~/repos/yay
makepkg --noconfirm -si
popd

sudo -s <<EOF
# enable pacman colored output
sed -i 's/^#Color$/Color/i' /etc/pacman.conf
# configuring reflector
cat ./reflector.conf > /etc/xdg/reflector/reflector.conf

# start/enable reflector
systemctl start reflector
systemctl enable reflector
EOF

# install window manager
yay -S --noconfirm polkit
yay -aS river --noconfirm

# install gui software
sudo pacman -S --noconfirm fish firefox alacritty neovide
