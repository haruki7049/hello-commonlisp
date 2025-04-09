{
  lib,
  callPackage,
  fetchzip,
  lispDerivation ? callPackage ../lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

lispDerivation {
  name = "rt";
  src = fetchzip {
    url = "https://beta.quicklisp.org/archive/rt/2010-10-06/rt-20101006-git.tgz";
    hash = "sha256-KxlltS8zCpuYX6Yp05eC2t/eWcTavD0XyOsp1XMWUY8=";
  };

  lisps = [
    sbcl
    clisp
    ecl
  ];

  runner = sbcl;
}
