#!/usr/bin/bash

set -eux

WXMSW_VERSION=3.2.5
CBREV_NO=13529
NAME=CodeBlocks-r${CBREV_NO}-wxWidgets-${WXMSW_VERSION}
HOME=$(cygpath -m /home)

pacman -Syy
pacman -S --noconfirm  wget git mingw-w64-i686-toolchain p7zip
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2
tar -jxf ./wxWidgets-3.2.5.tar.bz2
git clone https://github.com/arnholm/codeblocks_sfmirror.git
./cbp2make/cbp2make -in ./codeblocks_sfmirror/src/CodeBlocks_wx32.cbp -out ./codeblocks_sfmirror/src/makefile-core
cat ./codeblocks_sfmirror/src/makefile-core
