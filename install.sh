#! /bin/bash

package_list="ctags git tig tmux git nvim alacritty"

stow -S $package_list -t ~
