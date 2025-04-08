{
  lib,
  callPackage,
  fetchFromGitHub,
  fetchFromGitLab,
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
    hash = "sha256-NOd2W/7zVrsedJ9JyvIYerKCGeiPkGrnBoJOiMOiHVo=";
  };

  cl-plus-ssl = fetchFromGitHub {
    owner = "cl-plus-ssl";
    repo = "cl-plus-ssl";
    rev = "e6963f24a2ad2a8c3fc113697bae54e0f15c05b0";
    hash = "sha256-IJRWh8Lr7BSWxM2TB071tx6+pYmSAhWmcEDuDxrlN74=";
  };

  usocket = fetchFromGitHub {
    owner = "usocket";
    repo = "usocket";
    rev = "6456a3f7ece05c8b8f077dd079daffb8de122ead";
    hash = "sha256-xZbZnXOyhayXf+CsmktHv6kLAO6X4/dm+tiOqjF6/iw=";
  };

  vom = fetchFromGitHub {
    owner = "orthecreedence";
    repo = "vom";
    rev = "303c3f6804040f6b9490d423d87d4ee29ce73ca8";
    hash = "sha256-JeVHEh5yDOuSVpap1P/i4UC5xH7KsfFNhRfJAZPJ2eY=";
  };

  trivial-mimes = fetchFromGitHub {
    owner = "Shinmera";
    repo = "trivial-mimes";
    rev = "01cb46b062d6804ce707352e3de593c104f1cdeb";
    hash = "sha256-ulLRDzeAtc+z2Gxp+sSqLI6mGYU9KxUdnuFp+EREDio=";
  };

  trivial-utf-8 = fetchFromGitLab {
    domain = "gitlab.common-lisp.net";
    repo = "trivial-utf-8";
    owner = "trivial-utf-8";
    rev = "41421c98507bfa7dc5623aa997c4245e44dfcd4d";
    hash = "sha256-hxtF14wX0V0JH1rz1q2dHx+nrH7WEvqzoAzAUKK3UC4=";
  };

  mgl-pax = fetchFromGitHub {
    owner = "melisgl";
    repo = "mgl-pax";
    rev = "835a033bb067b6c85b76d389342a4c12e27c11ce";
    hash = "sha256-qqsL0sP8Z33/1nQFYCqzwj7QkwxH3qWny+hjczQ6wWk=";
  };

  fast-io = fetchFromGitHub {
    owner = "rpav";
    repo = "fast-io";
    rev = "a4c5ad600425842e8b6233b1fa22610ffcd874c3";
    hash = "sha256-YBTROnJyB8w3H+GDhlHI+6n7XvnyoGN+8lDh9ZQXAHI=";
  };

  quri = fetchFromGitHub {
    owner = "fukamachi";
    repo = "quri";
    rev = "45e0ff7f15a96ae9aef02b977375c6984d57a608";
    hash = "sha256-AK54HOWbnBTGWemZJMo84bjOBl4e7azbpy53cd6rOm4=";
  };

  idna = fetchFromGitHub {
    owner = "antifuchs";
    repo = "idna";
    rev = "bf789e6029b695ecba635964deac38130f55c7b4";
    hash = "sha256-QpUK5znagLTN4d7GMiAmOiRj1DWhpfdIwBR25+rIywI=";
  };

  split-sequence = fetchFromGitHub {
    owner = "sharplispers";
    repo = "split-sequence";
    rev = "89a10b4d697f03eb32ade3c373c4fd69800a841a";
    hash = "sha256-faF2EiQ+xXWHX9JlZ187xR2mWhdOYCpb4EZCPNoZ9uQ=";
  };

  flexi-streams = fetchFromGitHub {
    owner = "edicl";
    repo = "flexi-streams";
    rev = "4951d575b8f73270802a03cc5812b8310409caa9";
    hash = "sha256-cCpCBttChCko6+50ancWv6BGX9quPYGrrZpH5zMRYq4=";
  };

  trivial-gray-streams = fetchFromGitHub {
    owner = "trivial-gray-streams";
    repo = "trivial-gray-streams";
    rev = "a7ead683666849762ea657dac9137d693c5a4929";
    hash = "sha256-NXMvoSlMC/PyrKS0EVoGdempGZN6z3h0YRr102HBhkc=";
  };

  xsubseq = fetchFromGitHub {
    owner = "fukamachi";
    repo = "xsubseq";
    rev = "5ce430b3da5cda3a73b9cf5cee4df2843034422b";
    hash = "sha256-/aaUy8um0lZpJXuBMrLO3azbfjSOR4n1cJRVcQFO5/c=";
  };

  smart-buffer = fetchFromGitHub {
    owner = "fukamachi";
    repo = "smart-buffer";
    rev = "619759d8a6f821773bbc65c0bda553d30e51e6f3";
    hash = "sha256-+d58K2b6y8umupE3Yw9Hxw/DqEG6R/EeVqeGdFQwPuU=";
  };

  fast-http = fetchFromGitHub {
    owner = "fukamachi";
    repo = "fast-http";
    rev = "2232fc9b1e03313f9357824125b4a5327ec7b84b";
    hash = "sha256-AD4fOVh5dlLJGYLlO16prkkpNhJF95zV9zDRQISAnRE=";
  };

  proc-parse = fetchFromGitHub {
    owner = "fukamachi";
    repo = "proc-parse";
    rev = "3afe2b76f42f481f44a0a495256f7abeb69cef27";
    hash = "sha256-gpNY32YrKMp86FhWRZHSTeckmPJYV1UZ5Z5gt4yQax8=";
  };

  cl-utilities = fetchFromGitHub {
    owner = "Publitechs";
    repo = "cl-utilities";
    rev = "6b4de39201d439330aec0b3589931aa3be570e66";
    hash = "sha256-VZygX86y2HecmpEvtaDWWX9rZdzupc4awdqHBCpBJ34=";
  };

  bordeaux-threads = fetchFromGitHub {
    owner = "sionescu";
    repo = "bordeaux-threads";
    rev = "4aa13eb422bacd092c43abdade2943f5966bbff3";
    hash = "sha256-rL1/L85Gox/jIuNUVnqhOh9wZ0WLAOTJGOLENQusxIg=";
  };

  trivial-garbage = fetchFromGitHub {
    owner = "trivial-garbage";
    repo = "trivial-garbage";
    rev = "3474f6414b73d4e3aa2d5c53080f4247a34f6380";
    hash = "sha256-TZuXds3ACc5z/So1hBfR0zU3sy8DRA2BUuxO8Pju3GU=";
  };

  global-vars = fetchFromGitHub {
    owner = "lmj";
    repo = "global-vars";
    rev = "c749f32c9b606a1457daa47d59630708ac0c266e";
    hash = "sha256-bXxeNNnFsGbgP/any8rR3xBvHE9Rb4foVfrdQRHroxo=";
  };

  static-vectors = fetchFromGitHub {
    owner = "sionescu";
    repo = "static-vectors";
    rev = "3d9d89b4950b72e0e5bdacfcdfd366bde72386d2";
    hash = "sha256-sPTv2de1vx6FZLwzI0myQ3GNmQ2FYSxsjqZ04zw8w+o=";
  };

  swap-bytes = fetchFromGitHub {
    owner = "sionescu";
    repo = "swap-bytes";
    rev = "43ab1410a080d8abfe39078c1b3cecc32cf458f6";
    hash = "sha256-pRY9G693H1yAAOVCoVHcwXa93pDBrDoiDtGhgDDCzd4=";
  };

  clack = fetchFromGitHub {
    owner = "fukamachi";
    repo = "clack";
    rev = "935be5b7c862225556a312ed5ed5521a4afd98ae";
    hash = "sha256-hKTmQzrBTAonzkUr/iwA54oAEPDwyoGpiQ/koSwLy6w=";
  };

  lev = fetchFromGitHub {
    owner = "fukamachi";
    repo = "lev";
    rev = "b43e700c726da8cf0bd1d9123eb324b65c8ddf8e";
    hash = "sha256-pj17GKUbBNeC29Fv1Dwx7y+ualbMmMvSW7XQDd+nI9M=";
  };

  cffi = fetchFromGitHub {
    owner = "cffi";
    repo = "cffi";
    rev = "48eaef6f64c2c4830f3a1104432c66e6bad721a4";
    hash = "sha256-Qde7BZnkTEvRg0AfuN/l91ohWt2bWQZF+be49fIv6+g=";
  };

  babel = fetchFromGitHub {
    owner = "cl-babel";
    repo = "babel";
    rev = "23c14409dc89538b8a0bb2667a9784a5a72b795f";
    hash = "sha256-xxg8BhvfzScBa31XeJZeHyJM4i4Zo1fZ8tmZ7IdcqQw=";
  };

  trivial-features = fetchFromGitHub {
    owner = "trivial-features";
    repo = "trivial-features";
    rev = "18a5cfafa5ca2565f4297d1d986409facff68f00";
    hash = "sha256-2KxtbGtnlf6JgWDlX7LVdvaWCsPOUxb2aIZnrYvndGQ=";
  };

  alexandria = fetchFromGitLab {
    domain = "gitlab.common-lisp.net";
    repo = "alexandria";
    owner = "alexandria";
    rev = "8514d8e68ed0c733abf7f96f9e91b24912686dc4";
    hash = "sha256-vPHp/dXX24zUPF1t7EdBryzqlG33A0fOoD5loFOxAEs=";
  };
in

lispDerivation {
  pname = "hello-commonlisp-web";
  version = "dev";
  src = lib.cleanSource ./.;

  buildInputs = [
    woo
    idna
    split-sequence
    quri
    flexi-streams
    trivial-gray-streams
    fast-http
    xsubseq
    smart-buffer
    proc-parse
    cl-utilities
    trivial-garbage
    bordeaux-threads
    global-vars
    static-vectors
    swap-bytes
    clack
    lev
    cffi
    babel
    trivial-features
    alexandria
    fast-io
    trivial-utf-8
    mgl-pax
    trivial-mimes
    vom
    cl-plus-ssl
    usocket
  ];

  lispImpls = [
    sbcl
    clisp
    ecl
  ];
}
