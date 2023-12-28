#!/bin/bash

# Update Mirrorlist
sudo pacman -S --needed --noconfirm reflector rsync
sudo reflector --verbose --latest 10 --protocol https,http --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyy

# Update System
sudo pacman -Syu --noconfirm

# Uncomment Color, add ILoveCandy, Uncomment VerbosePkgLists, and set ParallelDownloads to 10 in pacman.conf
sudo sed -i '/^#Color/s/^#//' /etc/pacman.conf
sudo sed -i '/^Color/a ILoveCandy' /etc/pacman.conf
sudo sed -i '/^#VerbosePkgLists/s/^#//' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf

sudo pacman -Syy

# Wait for the installation to complete before proceeding
sleep 5

# Install YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --needed --noconfirm
cd ..
rm -rf yay

# Install Essential Programs
sudo pacman -S --needed --noconfirm android-tools bleachbit cmatrix eza firefox fwupd gamemode hwinfo inxi lolcat net-tools neofetch noto-fonts noto-fonts-extra ntfs-3g openssh pacman-contrib qbittorrent rsync samba sl speedtest-cli sshfs ttf-liberation ufw unrar vlc zsh

# Install Programs
sudo pacman -S --needed --noconfirm corectrl discord filezilla gimp libreoffice-fresh lutris telegram-desktop wine-staging

# Install Steam
sudo pacman -S steam

# Install KDE Plasma Packages
sudo pacman -S --needed --noconfirm ark spectacle kdeconnect gwenview kvantum okular packagekit-qt5

# Install Oh-My-ZSH and ZSH Plugins, move .zshrc
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 5  # Wait for 5 seconds

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 5  # Wait for 5 seconds

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 5  # Wait for 5 seconds

mv /home/$USER/archlinux/.zshrc /home/$USER/

# Install AUR Programs
yay -S --needed --noconfirm dropbox heroic-games-launcher-bin pamac-aur protonup-qt spotify stacer-bin stremio teamviewer

# Uncomment el_GR.UTF-8 in locale.gen
sudo sed -i 's/#el_GR.UTF-8 UTF-8/el_GR.UTF-8 UTF-8/' /etc/locale.gen

# Generate locales
sudo locale-gen

# Enable Bluetooth
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Enable Uncomplicated Firewall (UFW) and allow SSH traffic and KDE Connect
sudo systemctl enable ufw
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp   # Allow SSH traffic on port 22
sudo ufw allow 1714:1764/tcp # Allow KDE Connect
sudo ufw allow 1714:1764/udp # Allow KDE Connect
sudo ufw --force enable  # Enable UFW and reload rules

# Start and Enable SSH
sudo systemctl enable sshd
sudo systemctl start sshd

# Enable Paccache
sudo systemctl enable paccache.timer
sudo systemctl start paccache.timer

# Enable Reflector
sudo systemctl enable --now reflector.service reflector.timer
sudo systemctl start reflector.service reflector.timer

# Enable Teamviewer
sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service

# Clean up orphaned files and caches
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
rm -rf ~/.cache/*
sudo paccache -r

# Output Completion Message with Option to Reboot Immediately
echo -e "Reboot your system:\n1. Wait for automatic reboot in 10 seconds.\n2. Press Enter to reboot immediately."
read -t 10 -p "Press Enter to reboot now..." && sudo reboot || sudo reboot
