class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.57.0.orig.tar.gz"
  sha256 "042a0073397505acf150dbf91e5729eebddf44639ad8594d3f74919e6e288dfd"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://github.com/byllyfish/homebrew-oftr/releases/download/0.57.0"
    cellar :any_skip_relocation
    sha256 "121676e36a84fef095a00a62141e3d8ecb9dc1b73ea7e5fa5c91ebda5c3c9154" => :high_sierra
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
