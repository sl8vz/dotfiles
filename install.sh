#! /bin/bash

package_list="ctags git tig tmux git nvim starship fish ghostty"

stow -S $package_list -t ~
