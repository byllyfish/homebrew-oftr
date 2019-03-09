class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"
  url "https://launchpad.net/~byllyfish/+archive/ubuntu/oftr/+files/oftr_0.56.0.orig.tar.gz"
  sha256 "83660a8d5f09500731e8122af714652f4bb7bfdd3ff8a64ea241823c7fc5aa9a"
  head "https://github.com/byllyfish/oftr.git"

  bottle do
    root_url "https://github.com/byllyfish/homebrew-oftr/releases/download/0.56.0"
    cellar :any_skip_relocation
    sha256 "aa5871bf116ba8e1fa616a031a1cc6bfbd19fdc0bd70fd94ec166543daabfd2a" => :high_sierra
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
