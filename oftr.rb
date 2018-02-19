class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.46.0.orig.tar.gz"
  sha256 "bf0ccb1ff40816190b0662368a83ef9f3ba3158210fadacb0a1ec24eac69c41b"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://dl.bintray.com/byllyfish/bottles"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "fa5f3881d867cac3c3be082cd12e0adbb1d51ac07d6d8ffbb3be0aa100fe1d36" => :high_sierra
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
