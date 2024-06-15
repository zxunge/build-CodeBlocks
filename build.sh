#!/usr/bin/bash

set -eux

WXMSW_VERSION=3.2.5
CBREV_NO=13529
NAME=CodeBlocks-r${CBREV_NO}-wxWidgets-${WXMSW_VERSION}
HOME=$(cygpath -m /home)
MINGW32=$(cygpath -m /mingw32)

# Install dependencies
pacman -Syy
pacman -S --noconfirm  wget git mingw-w64-i686-toolchain p7zip

cp -r ./cbp2make /home/

# Building at /home for convenience
cd /home
wget https://github.com/wxWidgets/wxWidgets/releases/download/v${WXMSW_VERSION}/wxWidgets-${WXMSW_VERSION}.tar.bz2
tar -jxf ./wxWidgets-${WXMSW_VERSION}.tar.bz2

git clone https://github.com/arnholm/codeblocks_sfmirror.git
./cbp2make/cbp2make -in ./codeblocks_sfmirror/src/CodeBlocks_wx32.cbp -out ./codeblocks_sfmirror/src/makefile-core

# Build wxWidgets
cp -f ./setup.h ./wxWidgets-${WXMSW_VERSION}/include/wx/msw/
cp -f ./config.gcc ./wxWidgets-${WXMSW_VERSION}/build/msw/
cd wxWidgets-${WXMSW_VERSION}/build/msw
mingw32-make -f makefile.gcc setup_h
mingw32-make -f makefile.gcc -j$(nproc)

# We return to cmd to build CodeBlocks, pass some paths
echo "HOME=${HOME}" >> $GITHUB_OUTPUT
echo "MINGW32=${MINGW32}" >> $GITHUB_OUTPUT
