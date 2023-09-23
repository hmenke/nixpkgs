{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "mpigdb";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "robertu94";
    repo = "mpigdb";
    rev = "52821f4b3f85d3cd2ee10cc9f685446e5999851a"; # untagged 0.5.0
    hash = "sha256-o7k160JzupXZRtOKmz8urF0PqsXnVEJpZVePIE8X0PU=";
  };

  cargoPatches = [
    ./Cargo.lock.patch
  ];
  cargoHash = "sha256-DmhUV03xRI45J0cg7V7pEEI+cgJIsCAhpPfgng8T2yY=";

  meta = with lib; {
    description = "A wrapper arround mpiexec, gdbserver, and gdb that makes debugging MPI programs eaiser with a moderate number of processes";
    homepage = "https://github.com/robertu94/mpigdb";
    license = licenses.bsd2;
    platforms = platforms.linux;
    maintainers = with maintainers; [ hmenke ];
  };
}
