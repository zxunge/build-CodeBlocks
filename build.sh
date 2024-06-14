#!/usr/bin/bash

set -eux

pacman -Syy
pacman -S --noconfirm  wget git mingw-w64-i686-toolchain
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2
tar -jxvf ./wxWidgets-3.2.5.tar.bz2
git clone https://github.com/arnholm/codeblocks_sfmirror.git
cp -f ./setup.h ./wxWidgets-3.2.5/include/wx/msw/
cp -f ./config.gcc ./wxWidgets-3.2.5/build/msw/
cd ./wxWidgets-3.2.5/build/msw
cmd /c make -f makefile.gcc setup_h
cmd /c make -f makeflie.gcc -j8
