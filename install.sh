#! /bin/bash

package_list="ctags git tig tmux git nvim"

stow -S $package_list -t ~
