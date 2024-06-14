#!/usr/bin/bash

set -eux

pacman -Syy
pacman -S --noconfirm  wget
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2
tar -jxvf ./wxWidgets-3.2.5.tar.bz2
cd wxWidgets-3.2.5
