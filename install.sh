#! /bin/bash

package_list="ctags git tig tmux git nvim alacritty fish systemd"

stow -S ${package_list} -t ~
