#!/usr/bin/env bash

sudo pacman -S fish --noconfirm --needed
chsh -s /usr/bin/fish "$USER"
