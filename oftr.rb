class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.37.0.orig.tar.gz"
  sha256 "a24a9d42d2d70ced31e972d4f40d72d20ef6247659a1e21866de7bc59cec7a0b"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://dl.bintray.com/byllyfish/bottles"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "1ff50a9ecbefe9e29969d3c6763debe43e6cfedfe3c70631f002d6a7ba259f2a" => :sierra
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
