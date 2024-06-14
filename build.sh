#!/usr/bin/bash

set -eux

pacman -Syy
pacman -S --noconfirm  wget git
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2
tar -jxf ./wxWidgets-3.2.5.tar.bz2
git clone https://github.com/arnholm/codeblocks_sfmirror.git
cp -f ./setup.h ./wxWidgets-3.2.5/include/wx/msw/
cp -f ./config.gcc ./wxWidgets-3.2.5/build/msw/
cmd
cd wxWidgets-3.2.5/build/msw
D:/a/_temp/setup-msys2/mingw32/bin/make -f makefile.gcc setup_h
D:/a/_temp/setup-msys2/mingw32/bin/makemake -f makeflie.gcc -j8
