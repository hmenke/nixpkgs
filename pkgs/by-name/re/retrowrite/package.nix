{ fetchFromGitHub
, lib
, python3
, unstableGitUpdater
}:

python3.pkgs.buildPythonPackage rec {
  pname = "retrowrite";
  version = "unstable-2023-11-30";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "HexHive";
    repo = "retrowrite";
    rev = "ef4e541ac47fd032d30148fc61dfe48e94d5cd19";
    hash = "sha256-nbVYbWETkDmGxbM8+0GrZ5WbaSzjoO9Dd84eg4yUkVQ=";
  };

  patches = [
    ./setup.py.patch
  ];

  propagatedBuildInputs = with python3.pkgs; [
    archinfo
    capstone
    intervaltree
    pyelftools
  ];

  checkInputs = with python3.pkgs; [
    nose
  ];

  passthru.updateScript = unstableGitUpdater { };

  meta = with lib; {
    description = "Retrofitting compiler passes through binary rewriting";
    homepage = "https://github.com/hexhive/retrowrite/";
    license = licenses.mit;
    mainProgram = "retrowrite";
    maintainers = with maintainers; [ hmenke ];
    platforms = platforms.linux;
  };
}
