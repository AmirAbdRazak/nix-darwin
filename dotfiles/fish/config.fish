if status is-interactive
    # Commands to run in interactive sessions can go here
end


if test (uname -s) = "Darwin"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

function nix-gc
    nix-store --gc --print-dead
    nix-collect-garbage -d 
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
    sudo darwin-rebuild switch --flake $HOME/.config/nix-darwin
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

alias n "nvim"
alias vim "nvim"

alias ll "ls -Filah"
set -gx TERM xterm-256color
starship init fish | source
fzf --fish | source
direnv hook fish | source
zoxide init fish | source
eval (opam env)
