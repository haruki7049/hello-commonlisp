{
  lib,
  stdenv,
  replaceVars,
}:

{
  name ? null,
  pname,
  version ? null,
  src,
  buildInputs ? [],
  lisps,
  runner,
}@args:

stdenv.mkDerivation rec {
  name = args.name or "${args.pname}-${args.version}";
  inherit (args) src;

  builderScript = replaceVars ./builder.lisp {
    pname = args.name or args.pname;
  };

  checkerScript = replaceVars ./checker.lisp {
    pname = args.name or args.pname;
  };

  doCheck = true;

  checkPhase = ''
    runHook preCheck

    export HOME=$TMPDIR

    ${lib.strings.concatStringsSep "\n" (
      builtins.map (drv: "cat '${checkerScript}' | ${lib.getExe drv}") lisps
    )}

    runHook postCheck
  '';

  buildPhase = ''
    runHook preBuild

    export HOME=$TMPDIR

    ${lib.strings.concatStringsSep "\n" (
      builtins.map (drv: "cat '${builderScript}' | ${lib.getExe drv}") lisps
    )}

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir $out
    cp -r * $out

    runHook postInstall
  '';

  propagatedBuildInputs = buildInputs ++ [ runner ];

  CL_SOURCE_REGISTRY = "${lib.strings.concatStringsSep ":" (builtins.map (drv: "${drv}") args.buildInputs)}:${args.src}";
}
