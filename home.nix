{ config, pkgs, ... }:

{ 
  home = { 
    username = "amirrazak"; 
    homeDirectory = "/Users/amirrazak"; 
    stateVersion = "24.11"; 
    packages = []; 
    file = { 
      ".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
      ".config/wezterm".source = ./dotfiles/wezterm;
    }; 
    sessionVariables = {}; 
    sessionPath = [ "/run/current-system/sw/bin" "$HOME/.nix-profile/bin" ]; 
  };
  programs.home-manager.enable = true; 
}
