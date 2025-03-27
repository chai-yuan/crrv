{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    crPkgs.url = "github:chai-yuan/crpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      crPkgs,
    }:
    let
      supportedSystems = [
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          crpkgs = crPkgs.packages.${system} or { };
        in
        {
          default = pkgs.mkShell {
            packages = [
              # verilator sim
              pkgs.gcc
              pkgs.gnumake
              pkgs.verilator
              # chisel
              pkgs.dtc
              pkgs.jdk17
              pkgs.mill
              # develop
              pkgs.metals
              pkgs.coursier
            ];

            shellHook = ''
              echo "Welcome to the Nix environment for ${system}"
            '';
          };
        }
      );
    };
}
