# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cpolar < Formula
  desc "Cpolar Client"
  homepage "https://www.cpolar.com"
  license ""
  version "3.3.18"

  arch = "arm64"
  sha256 "08a5f5e708b01576efa453419d0844cbe7fd8ffd4cd9d515edc654defffd19b9"
  platform = "darwin"

  on_intel do
    arch = "amd64"
    sha256 "66b4f20558de0de6fe9c2c9c0495aecb71dcbbf73ed830021a3adc0a89120b0c"
  end

  on_linux do
    platform = "linux"
    sha256 "5cd3320c4369928ccb509c4f5fa2ec3b86151ead77e1b77c1694aa64c43e32e7"
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
