{
  lib,
  callPackage,
  lispDerivation ? callPackage ./nix/lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

let
  woo = fetchFromGitHub {
    owner = "fukamachi";
    repo = "woo";
    rev = "7f5219c55d49190f5ae17b123a8729b31c5d706e";
    hash = "";
  };
in

lispDerivation {
  pname = "hello-commonlisp-web";
  version = "dev";
  src = lib.cleanSource ./.;

  buildInputs = [
    woo
  ];

  lispImpls = [
    sbcl
    clisp
    ecl
  ];
}
