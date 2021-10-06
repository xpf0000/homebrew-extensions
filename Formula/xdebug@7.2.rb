# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Xdebug Extension
class XdebugAT72 < AbstractPhpExtension
  init
  desc "Xdebug PHP extension"
  homepage "https://github.com/xdebug/xdebug"
  url "https://github.com/xdebug/xdebug/archive/3.1.0.tar.gz"
  sha256 "0a023d9847a60bb0aff9509d92457e9c0077942d09e8bedb8e97bd3b90abd7a0"
  head "https://github.com/xdebug/xdebug.git"
  license "PHP-3.0"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 big_sur:      "cfea70d850ff7ec843befcb47f976de94d75e6b3fcd7da64611dbafe99255a39"
    sha256 catalina:     "06760ccd96c05f74046b239f3046210111e41168297307d81f15414e902b7eb2"
    sha256 x86_64_linux: "a95752807641d708c6891960fd940655376901c430ad73e03bc4552ffc493555"
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-xdebug"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end
end
