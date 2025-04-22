if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
fzf --fish | source
pyenv init - | source

# Abbreviations
abbr --add ls lsd
abbr --add ll lsd -al
abbr --add ccli commander-cli
abbr --add g git

# Variables
set -gx BR2_DL_DIR ~/dev/br_dl/
set -gx BR2_CCACHE_DIR ~/dev/br_ccache/
set -gx BR2_USE_CCACHE 1
set -gx SHELLCHECK_OPTS '--enable=all --severity=style'
set --universal nvm_default_version v22.14.0
