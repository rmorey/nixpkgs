{ stdenv, fetchFromGitHub, xsel }:

stdenv.mkDerivation rec {

  name = "yank-${meta.version}";

  src = fetchFromGitHub {
    owner = "mptre";
    repo = "yank";
    rev = "v${meta.version}";
    sha256 = "03h99i59kq8jlmshfwas1qm4y5ksw9lxaf9kr14l2mp028g7930n";
    inherit name;
  };

  installFlags = [ "PREFIX=$(out)" ];
  makeFlags = [ "YANKCMD=${xsel}/bin/xsel" ];

  meta = with stdenv.lib; {
    homepage = https://github.com/mptre/yank;
    description = "Yank terminal output to clipboard";
    longDescription = ''
      Read input from stdin and display a selection interface that allows a
      field to be selected and copied to the clipboard. Fields are determined
      by splitting the input on a delimiter sequence, optionally specified
      using the -d option. New line, carriage return and tab characters are
      always treated as delimiters.
    '';
    downloadPage = "https://github.com/mptre/yank/releases";
    license = licenses.mit;
    version = "1.0.0";
    maintainers = [ maintainers.dochang ];
    platforms = platforms.unix;
  };

}
