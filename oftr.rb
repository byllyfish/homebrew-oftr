class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.36.0.orig.tar.gz"
  sha256 "8f6b140f1245ab3b3990cb8a0aaf7e218fb15a51ddf514c78579f926e6060953"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://dl.bintray.com/byllyfish/bottles"
    cellar :any_skip_relocation
    sha256 "74d33f3210c278372728854c2d8f844a68a71812ac4e5f6d806837533e3a5859" => :sierra
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
