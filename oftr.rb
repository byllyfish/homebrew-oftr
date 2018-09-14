class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.52.0.orig.tar.gz"
  sha256 "5a74356d1d3fcc4920f838502ed6be33f1dc4044b8893ee1f7611848dacd9c2f"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://github.com/byllyfish/homebrew-oftr/releases/download/0.52.0"
    cellar :any_skip_relocation
    sha256 "59b7ab7faf04d99d5e21ea584aa2fd643a7033d6c46c3cd32f07373094623777" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    args = std_cmake_args

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    (testpath/"hello.yml").write("type: HELLO")
    system "#{bin}/oftr", "encode", "--hex", "--ofversion=4", "hello.yml"
  end
end
