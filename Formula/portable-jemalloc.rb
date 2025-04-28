require File.expand_path("../Abstract/portable-formula", __dir__)

class PortableJemalloc < PortableFormula
  desc "Implementation of malloc emphasizing fragmentation avoidance"
  homepage "https://jemalloc.net/"
  url "https://github.com/jemalloc/jemalloc/releases/download/5.3.0/jemalloc-5.3.0.tar.bz2"
  sha256 "2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa"
  license "BSD-2-Clause"

  livecheck do
    formula "jemalloc"
  end

  def install
    system "./configure", *portable_configure_args,
                          *std_configure_args,
                          "--enable-static",
                          "--disable-shared",
                          "--disable-docs",
                          "--disable-debug",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
