#!/bin/bash

dotfilesDir=$(pwd)

set -x

function linkDotfile {
  dest="${HOME}/${1}"
  src="${dotfilesDir}/${1}"

  if [[ ! -f "${src}" ]]
  then
    echo "${1} does not exist"
    exit 1
  fi

  echo "Creating symlink: ${dest}"
  ln --symbolic --force "${src}" "${dest}"
}

linkDotfile .vimrc

mkdir ~/.vim/usr 2> /dev/null
ln --symbolic --force ${dotfilesDir}/plugins.vim ~/.vim/usr/plugins.vim 
vim +PluginInstall +qall
