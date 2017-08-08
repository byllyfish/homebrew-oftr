class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.33.0.orig.tar.gz"
  sha256 "acc9defe09c9c208216ec85b4e750ef887bdf2374fb6706372522f3f4a549f16"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    cellar :any_skip_relocation
    root_url "https://dl.bintray.com/byllyfish/bottles"
    sha256 "928750d4e5dce4008b273d8508c4bc9b1850fc599dcc538033d21d5170dc5b03" => :sierra
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
