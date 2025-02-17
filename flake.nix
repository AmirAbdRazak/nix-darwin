{
  description = "mrreowf mrrrp nya meow mrow";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url =  "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [ 
          cargo
          lazygit
          git
          babelfish
          tmux
	  neovim
          vim
          neofetch
          btop
	  subversion
	  fzf
	  zoxide
	  bat
          ripgrep
          mkalias
      ];

      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];

      system.activationScripts.applications.text = let 
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in 
        pkgs.lib.mkForce ''
          echo "mrreowf purr... (Translation: setting up indexes in /Applications)..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do 
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      homebrew = {
          enable = true;
          taps = [];
          brews = [];
          casks = [
            "wezterm"
          ];
      };

      nix = {
        settings.experimental-features = "nix-command flakes";
        enable = false;
      };

      services.aerospace = {
          enable = true;
          settings = import ./dotfiles/aerospace/aerospace.nix;
      };
      programs.fish.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };

    homeManagerConfig = {pkgs, ...}: {
          users.users."amirrazak" = {
            shell = pkgs.fish;
            name = "amirrazak";
            home = "/Users/amirrazak";
          };
          home-manager.users."amirrazak" = import ./home.nix;
    };
  in
  {
    darwinConfigurations."meow-mini" = nix-darwin.lib.darwinSystem {
      modules = [ 
        home-manager.darwinModules.home-manager
        configuration 
        homeManagerConfig
      ];
    };

    darwinPackages = self.darwinConfigurations."meow-mini".pkgs;
  };
}
