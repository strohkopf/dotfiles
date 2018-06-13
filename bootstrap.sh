#!/bin/bash
set -e

SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# create symlink if needed
if [[ -L "${HOME}/.vimrc" && -f "${HOME}/.vimrc" ]]; then
	echo "nothing todo vimrc is already symlinked"
else
	echo  "creating symlink for vimrc"
	ln -s "${SCRIPTPATH}/vim/vimrc" "${HOME}/.vimrc"
fi

if [[ -L "${HOME}/.vim" && -d "${HOME}/.vim" ]]; then
	echo "nothing todo vim directory is already symlinked"
else
	echo  "creating symlink for vim directory"
	ln -s "${SCRIPTPATH}/vim" "${HOME}/.vim"
fi

# init git submodules
git submodule init
git submodule update
