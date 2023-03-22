# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cpolar < Formula
  desc "Cpolar Client"
  homepage "https://www.cpolar.com"
  license ""
  version "3.3.18"

  arch = "arm64"
  sha256 "f733f2bfa09e3428254d2239121bdd4dd7fe301b4b1c901cb0a89ddbe71bf01f"
  platform = "darwin"

  on_intel do
    arch = "amd64"
    sha256 "524aea23e8f59e0f1acb1c71bf2ec56e571193d7b470a336934857a58f3f015e"
  end

  on_linux do
    platform = "linux"
    sha256 "c4513b2f6fc669ae42139197056edad66ade06dc805376ea95d9f6d4edb209b7"
  end

  url "https://static.cpolar.com/downloads/releases/#{version}/cpolar-stable-#{platform}-#{arch}.zip"


  # depends_on "cmake" => :build
  # Don't update this unless this version cannot bootstrap the new version.


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method

    bin.install "cpolar"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cpolar-foo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/cpolar", "version"
  end
end
