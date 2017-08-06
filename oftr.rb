class Oftr < Formula
  desc "OpenFlow to YAML Translator and Microservice"
  homepage "https://github.com/byllyfish/oftr"

  head "https://github.com/byllyfish/oftr.git", 
        :branch => :master

  stable "https://github.com/byllyfish/oftr.git", 
        :tag => "v0.32.0",
        :revision => "cfce9c7f11a25ba2b55677afc771c057bfd73caf"

  #devel "https://github.com/byllyfish/oftr.git", 
  #      :branch => :develop

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
    system "#{bin}/oftr", "--version"
  end
end
