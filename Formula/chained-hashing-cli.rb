class ChainedHashingCLI < Formula
  desc "ChainedHash command-line interface"
  homepage "https://github.com/pviniciusfm/chained-hashing-cli"
  url "https://github.com/pviniciusfm/chained-hashing-cli.git",
      tag:      "v0.0.1",
      revision: "9da3c3a1f72271e022f02897ed587f2ce1fcddf3"
  license "MIT"
  head "https://github.com/pviniciusfm/chained-hashing-cli.git", branch: "main"

  bottle do
    root_url "https://github.com/pviniciusfm/chained-hashing-cli/releases/download/v0.0.1"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, monterey:       "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, big_sur:        "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, catalina:       "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, mojave:         "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, high_sierra:    "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, sierra:         "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
    sha256 cellar: :any_skip_relocation, el_capitan:     "2bf14f3f6cd15b18fe3c96585ceea2d2e538bf1c0c384aba4cd0ac78c19ea287"
  end

  depends_on :macos
  if Hardware::CPU.arm?
    depends_on xcode: ["12.2", :build]
  else
    depends_on xcode: ["12.0", :build]
  end

  def install
    system "script/build", "--universal"
    system "script/install", "--universal", prefix

    bash_completion.install "contrib/completion/chained-hashing-cli.bash" => "chcli"
    fish_completion.install "contrib/completion/chained-hashing-cli.fish"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/chcli version").chomp
  end
end
