class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.58.0.orig.tar.gz"
  sha256 "77a497fee4717bc6044bb7b2f22b4c0d23cdc701a3cb85f85b190325f8e2bb0d"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://github.com/byllyfish/homebrew-oftr/releases/download/0.58.0"
    cellar :any_skip_relocation
    sha256 "d5cf2b8ca06f46d39f80ac18ed60dddf4169d585c44ca1b4501fda17c937fa33" => :high_sierra
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
