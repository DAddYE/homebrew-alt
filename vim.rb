require 'formula'

class Vim < Formula
  # Get stable versions from hg repo instead of downloading an increasing
  # number of separate patches.
  url 'https://vim.googlecode.com/hg/', :revision => 'b35844f3eb49'
  version '7.3.480'
  homepage 'http://www.vim.org/'

  head 'https://vim.googlecode.com/hg/'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-gui=no",
                          "--without-x",
                          "--disable-nls",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--enable-cscope",
                          "--with-features=huge"
:q
q
    system "iconv -c -t UTF-8 ./runtime/tools/efm_perl.pl > ./runtime/tools/efm_perl.pl"
    system "make"
    system "make install"
  end
end
