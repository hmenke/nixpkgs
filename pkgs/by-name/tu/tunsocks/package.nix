{ autoreconfHook
, fetchFromGitHub
, lib
, stdenv
, unstableGitUpdater
}:

stdenv.mkDerivation {
  pname = "tunsocks";
  version = "unstable-2023-06-22";

  src = fetchFromGitHub {
    owner = "russdill";
    repo = "tunsocks";
    rev = "4e4ff8682053412145930b8daf2c55d357cf1e44";
    hash = "";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ autoreconfHook ];

  passthru.updateScript = unstableGitUpdater { };

  meta = with lib; {
    description = "User-level IP forwarding, SOCKS proxy, and HTTP proxy for VPNs that provide tun-like interface";
    homepage = "https://github.com/russdill/tunsocks";
    license = licenses.bsd3;
    mainProgram = "tunsocks";
    maintainers = with maintainers; [ hmenke ];
    platforms = platforms.linux;
  };
}
