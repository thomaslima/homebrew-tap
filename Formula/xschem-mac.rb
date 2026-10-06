class XschemMac < Formula
  desc "Schematic capture and netlisting, native macOS (Aqua Tk) fork of xschem"
  homepage "https://github.com/thomaslima/xschem"
  url "https://github.com/thomaslima/xschem/archive/refs/tags/v3.4.8RC-mac.3.tar.gz"
  version "3.4.8RC-mac.3"
  sha256 "a7f8556408c49048975676b2dbf805e4d22d946d17734e172ffbe598998469b3"
  license "GPL-2.0-or-later"
  head "https://github.com/thomaslima/xschem.git", branch: "main"

  depends_on "bison" => :build
  depends_on "cairo"
  depends_on "ghostscript" # ps2pdf, run by PDF export
  depends_on "jpeg-turbo"
  depends_on :macos
  depends_on "tcl-tk@8" # the Aqua port supports Tk 8.6 only

  def install
    system "./configure", "--aqua", "--aqua-tk=#{formula_opt_prefix("tcl-tk@8")}", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    # small bundle that runs the installed binary, for the Finder and the Dock
    system "sh", "XSchemMac/make_app.sh", "-l", "-b", bin/"xschem", prefix/"Xschem.app"
  end

  def caveats
    <<~EOS
      Xschem.app starts this xschem from the Finder or the Dock. To show it in Applications:
        ln -sf "#{opt_prefix}/Xschem.app" /Applications/Xschem.app
      If /Applications/Xschem.app is already a folder (for example a copy from the
      release disk image), move it to the Trash first; otherwise ln puts the link
      inside that folder.
    EOS
  end

  test do
    system bin/"xschem", "-x", "-q", "-r", "-s", "-n", "-o", testpath,
           share/"doc/xschem/examples/cmos_inv.sch"
    assert_match(/^M1 D A 0 0 n /, (testpath/"cmos_inv.spice").read)
    assert_predicate prefix/"Xschem.app/Contents/MacOS/xschem", :executable?
  end
end
