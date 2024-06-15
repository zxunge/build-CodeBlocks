#!/usr/bin/bash

set -eux

WXMSW_VERSION=3.2.5
CBREV_NO=13529
NAME=CodeBlocks-r${CBREV_NO}-wxWidgets-${WXMSW_VERSION}
HOME=$(cygpath -m /home)

7zr a -mx9 -mqs=on -mmt=on /home/${NAME}.7z /home/binaries

if [[ -v GITHUB_WORKFLOW ]]; then
  echo "OUTPUT_BINARY=${HOME}/${NAME}.7z" >> $GITHUB_OUTPUT
  echo "RELEASE_NAME=CodeBlocks-r${CBREV_NO}-wxWidgets-${WXMSW_VERSION}" >> $GITHUB_OUTPUT
  echo "WXMSW_VERSION=${WXMSW_VERSION}" >> $GITHUB_OUTPUT
  echo "CBREV_NO=${CBREV_NO}" >> $GITHUB_OUTPUT
  echo "OUTPUT_NAME=${NAME}.7z" >> $GITHUB_OUTPUT
fi
