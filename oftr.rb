class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.34.0.orig.tar.gz"
  sha256 "ca663e022693dc06b2719f899088e0eaf7871721a957d80297eed3bc410f081c"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://dl.bintray.com/byllyfish/bottles"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "1b08c344d260a4b40bb6de8c140acb04b1909534e0c0cc85b4f0c7e174399320" => :sierra
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
