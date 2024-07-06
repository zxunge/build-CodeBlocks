#!/usr/bin/bash

set -eux

CBREV_NO=13536
WXMSW_VERSION=3.2.5
HOME_PATH=$(cygpath -m ~)
RELEASE_NAME=CodeBlocks-r${CBREV_NO}-wx${WXMSW_VERSION}

git clone https://github.com/arnholm/codeblocks_sfmirror.git

cd codeblocks_sfmirror/
./bootstrap
./configure --prefix=$HOME/codeblocks --with-contrib-plugins=all,-NassiShneiderman

make -j$(nproc)
make install

7zr a -mx9 -mqs=on -mmt=on $HOME/${RELEASE_NAME}.7z $HOME/codeblocks

if [[ -v GITHUB_WORKFLOW ]]; then
  echo "OUTPUT_BINARY=${HOME_PATH}/${RELEASE_NAME}.7z" >> $GITHUB_OUTPUT
  echo "RELEASE_NAME=${RELEASE_NAME}" >> $GITHUB_OUTPUT
  echo "WXMSW_VERSION=${WXMSW_VERSION}" >> $GITHUB_OUTPUT
  echo "CBREV_NO=${CBREV_NO}" >> $GITHUB_OUTPUT
  echo "OUTPUT_NAME=${RELEASE_NAME}.7z" >> $GITHUB_OUTPUT
fi

