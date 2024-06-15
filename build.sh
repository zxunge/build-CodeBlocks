#!/usr/bin/bash

set -eux

WXMSW_VERSION=3.2.5
CBREVNO=13529
NAME=CodeBlocks-r${CBREVNO}-wxWidgets-${WXMSW_VERSION}

pacman -Syy
pacman -S --noconfirm  wget git mingw-w64-i686-toolchain p7zip
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2
tar -jxf ./wxWidgets-3.2.5.tar.bz2
git clone https://github.com/arnholm/codeblocks_sfmirror.git
cp -f ./setup.h ./wxWidgets-3.2.5/include/wx/msw/
cp -f ./config.gcc ./wxWidgets-3.2.5/build/msw/
cd wxWidgets-3.2.5/build/msw
mingw32-make -f makefile.gcc setup_h
mingw32-make -f makefile.gcc -j8

7zr a -mx9 -mqs=on -mmt=on ./${NAME}.7z ../../lib

if [[ -v GITHUB_WORKFLOW ]]; then
  echo "OUTPUT_BINARY=${NAME}.7z" >> $GITHUB_OUTPUT
  echo "RELEASE_NAME=CodeBlocks-r${CBREVNO}-wxWidgets-${WXMSW_VERSION}" >> $GITHUB_OUTPUT
fi
