{
  inputs = {
    nixpkgs.url = "nixpkgs";
    utils.url = "flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rnix-lsp
            shellcheck
            shfmt
            nodePackages.bash-language-server
            nodePackages.yaml-language-server
          ];
        };
      });
}
