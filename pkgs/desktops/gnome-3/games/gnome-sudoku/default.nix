{ stdenv, fetchurl, pkgconfig, intltool, gtk3, gnome3, wrapGAppsHook
, json-glib, qqwing, itstool, libxml2 }:

stdenv.mkDerivation rec {
  name = "gnome-sudoku-${version}";
  version = "3.30.0";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-sudoku/${gnome3.versionBranch version}/${name}.tar.xz";
    sha256 = "1xy986s51jnrcqwan2hy4bjdg6797yr9s7gxx2z2q4j4gkx3qa1f";
  };

  passthru = {
    updateScript = gnome3.updateScript { packageName = "gnome-sudoku"; attrPath = "gnome3.gnome-sudoku"; };
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ intltool wrapGAppsHook gtk3 gnome3.libgee
                  json-glib qqwing itstool libxml2 ];

  meta = with stdenv.lib; {
    homepage = https://wiki.gnome.org/Apps/Sudoku;
    description = "Test your logic skills in this number grid puzzle";
    maintainers = gnome3.maintainers;
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
