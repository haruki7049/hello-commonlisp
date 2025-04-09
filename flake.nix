{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-compat.url = "github:edolstra/flake-compat";
    cl-asdf-setup-nix = {
      url = "github:haruki7049/cl-asdf-setup.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem =
        { pkgs, system, lib, ... }:
        let
          fiveam = pkgs.callPackage ./nix/fiveam { };
          hello-commonlisp = pkgs.lispDerivation {
            pname = "hello-commonlisp";
            version = "dev";
            src = lib.cleanSource ./.;

            lispLibs = [
              fiveam
            ];

            lisps = [
              pkgs.sbcl
            ];

            doCheck = true;

            runner = pkgs.sbcl;
          };
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.cl-asdf-setup-nix.overlays.default
            ];
          };

          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
          };

          packages = {
            inherit hello-commonlisp;
            default = hello-commonlisp;
          };

          devShells.default = pkgs.mkShell {
            nativeBuildInputs = [
              pkgs.nil
            ];
          };
        };
    };
}
