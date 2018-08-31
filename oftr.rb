class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.51.0.orig.tar.gz"
  sha256 "cc66b62f6bad1fbfe0abbc64f31bf49eaa1a23462076e92645e71b9bb5b98a2a"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://github.com/byllyfish/homebrew-oftr/releases/download/0.51.0"
    cellar :any_skip_relocation
    sha256 "47dbf03b6230528349035f796763ed052335a10d844223aaba54f459a940157a" => :high_sierra
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
