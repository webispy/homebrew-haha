class Aln < Formula
  desc "Amazing Lucky Numbers Library"
  homepage "https://github.com/webispy/aln"
  url "https://github.com/webispy/aln/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8db44f88840ae7c93eb237e5aec9f8aa49c5c03bf29e3360f5eabed2f7729902"
  license "Apache-2.0"

  head "https://github.com/webispy/aln.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-haha/releases/download/aln-0.1.0"
    sha256 cellar: :any,                 arm64_sonoma: "1521a642335a82a6e039109f22730476d7180e92a1fe6ffb04348e01a42503d9"
    sha256 cellar: :any,                 ventura:      "8143c23b5fb4650b31dc6ca90eaaa6c3ea15615ff405fed4a1c588bc3e6ecba9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1eb42a074a8698120b27d65d460dc2e1feb7a959a0edb3c20dd3190eeddb0221"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"

  def install
    args = %W[
      -DCMAKE_INSTALL_RPATH=#{rpath}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/aln"
  end
end
