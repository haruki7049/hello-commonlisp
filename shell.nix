{
  mkShell,
  callPackage,
  fetchFromGitHub,
  makeCommonLispSourceRegistry ? callPackage ./nix/makeCommonLispSourceRegistry { },

  sbcl,
}:

let
  woo = fetchFromGitHub {
    owner = "fukamachi";
    repo = "woo";
    rev = "7f5219c55d49190f5ae17b123a8729b31c5d706e";
    hash = "sha256-NOd2W/7zVrsedJ9JyvIYerKCGeiPkGrnBoJOiMOiHVo=";
  };
in

mkShell rec {
  packages = [
    sbcl
  ];

  buildInputs = [
    woo
  ];

  CL_SOURCE_REGISTRY = makeCommonLispSourceRegistry buildInputs;
}
