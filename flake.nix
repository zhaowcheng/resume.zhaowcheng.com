{
  description = "Development environment for jekyll template resumecards";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.ruby
          ];
          shellHook = ''
            export PS1="[resumecards-dev-env:\w]\$ "
            bundle config set path '.gem/'
            bundle install
          '';
        };
      }
    );
}
