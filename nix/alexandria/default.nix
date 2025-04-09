{
  lib,
  callPackage,
  fetchFromGitLab,
  lispDerivation ? callPackage ../lispDerivation { },

  cl-rt ? callPackage ../cl-rt { },

  sbcl,
  clisp,
  ecl,
}:

lispDerivation {
  name = "alexandria";
  src = fetchFromGitLab {
    domain = "gitlab.common-lisp.net";
    repo = "alexandria";
    owner = "alexandria";
    rev = "8514d8e68ed0c733abf7f96f9e91b24912686dc4";
    hash = "sha256-vPHp/dXX24zUPF1t7EdBryzqlG33A0fOoD5loFOxAEs=";
  };

  lispLibs = [
    cl-rt
  ];

  lisps = [
    sbcl
    clisp
    ecl
  ];

  runner = sbcl;
}
