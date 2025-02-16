if status is-interactive
    # Commands to run in interactive sessions can go here
end


if test (uname -s) = "Darwin"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

function fish-source
    source $HOME/.config/fish/config.fish
end

function nix-edit-config
    cd $HOME/.config/nix-darwin
    nvim flake.nix
    cd -
end

function nix-rebuild
    darwin-rebuild switch --flake $HOME/.config/nix-darwin
end

function is-nix-env
    echo $IN_NIX_SHELL
end

function whisper
    echo "whadahell..."
end

function shout
    echo "WHADAHELL!!!"
end

function nix-history
    darwin-rebuild --list-generations
end

set -gx PATH /run/current-system/sw/bin $PATH
set -g PATH /usr/local/bin $PATH
bind -k "up" history-search-backward
bind -k "down" history-search-forward

alias hm "nix run home-manager"
alias n "nvim"

fzf --fish | source
zoxide init fish | source
