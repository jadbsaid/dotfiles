#!/usr/bin/env bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru && makepkg -si
