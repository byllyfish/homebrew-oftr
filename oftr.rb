class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.49.0.orig.tar.gz"
  sha256 "02e2e199a77efc4dd850b872d315825835eb638993d105afd6b106e5ee99a98e"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://dl.bintray.com/byllyfish/bottles"
    cellar :any_skip_relocation
    sha256 "11e231482a4c6ab12df4bd5e4c1cd385d04e3abcd1e3c9a42c47e8dc2fb3f702" => :high_sierra
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
