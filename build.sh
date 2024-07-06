#!/usr/bin/bash

set -eux

CBREV_NO=13536
WXMSW_VERSION=3.2.5
GCC_LINK=https://github.com/brechtsanders/winlibs_mingw/releases/download/14.1.0posix-18.1.7-12.0.0-ucrt-r2/winlibs-i686-posix-dwarf-gcc-14.1.0-mingw-w64ucrt-12.0.0-r2.7z
WXMSW_LINK=https://github.com/zxunge/build-wxWidgets/releases/download/wxWidgets-3.2.5-14-stl-cb/wxWidgets-3.2.5-14-stl-cb.7z
PRECB_LINK=https://wxstuff.xaviou.fr/download/codeblocks/windows/CB_20240626_rev13533_wx32_win32.7z
WXINCLUDE_LINK=https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5-headers.7z
HOME_PATH=$(cygpath -m ~)
RELEASE_NAME=CodeBlocks-r${CBREV_NO}-wx${WXMSW_VERSION}

wget -q ${GCC_LINK}
wget -q ${WXMSW_LINK}
wget -q ${PRECB_LINK}
wget -q ${WXINCLUDE_LINK}
7z x winlibs-*.7z -o./compilergcc/
7z x wxWidgets-*.7z -o./wxwin/
7z x CB_*.7z -o./precb/

git clone https://github.com/arnholm/codeblocks_sfmirror.git

BUILD_TYPE=--build
START_CMD='start "Code::Blocks Build (wx3.2.x)" /D"%~dp0" /min /b'
# ------------------------------------------------
# Setup C::B application to run the *binaries* (!)
# ------------------------------------------------
export CB_ROOT=$HOME/precb
export GCC_ROOT=$HOME/compilergcc/mingw32
export PATH=$HOME/precb/:$HOME/compilergcc/mingw32/bin/:$PATH
# ------------------------------------------------
# Setup folder to the C::B *sources* from SVN (!)
# ------------------------------------------------
export CB_SRC=$HOME/codeblocks_sfmirror/src

# -------------------------------------------
# Usually below here no changes are required.
# -------------------------------------------
if [ -e $CB_APP ]; then
  if [ -d $CB_SRC ]; then
    export CB_PARAMS="--batch-build-notify --no-batch-window-close"
    export CB_TARGET="--target=All"
    export CB_CMD="--build $CB_SRC/CodeBlocks-wx32.workspace"

    echo $CB_APP $CB_PARAMS $CB_TARGET $CB_CMD
    $CB_APP $CB_PARAMS $CB_TARGET $CB_CMD
    echo "Do not forget to run 'update' after successful build!"
  else
    echo "C::B sources at '$CB_SRC' not found."
  fi
else
  echo "File '$CB_APP' does not exists."
fi
