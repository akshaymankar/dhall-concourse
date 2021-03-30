let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  fly = pkgs.callPackage ./nix/fly.nix {};

  commonPaths = [pkgs.dhall pkgs.dhall-json pkgs.shellcheck];
  ciPaths = commonPaths ++ [ pkgs.bash pkgs.git ];
  devPaths = commonPaths ++ [fly pkgs.jq];
in {
  devEnv = pkgs.buildEnv {
    name = "dhall-concourse-devenv";
    paths = devPaths;
  };
  ciEnv = pkgs.buildEnv {
    name = "dhall-concourse-cienv";
    paths = ciPaths;
  };
}
