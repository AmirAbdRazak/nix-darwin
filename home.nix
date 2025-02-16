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
      ".config/starship.toml".source = ./dotfiles/starship/starship.toml;
    }; 
    sessionVariables = {}; 
    sessionPath = [ "/run/current-system/sw/bin" "$HOME/.nix-profile/bin" ]; 
  };

  programs.starship = {
    enable = true;
  };

  programs.home-manager.enable = true; 
}
