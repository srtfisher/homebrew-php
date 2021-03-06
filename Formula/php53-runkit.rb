require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Runkit < AbstractPhp53Extension
  init
  homepage 'http://php.net/manual/en/book.runkit.php'
  url 'https://github.com/downloads/zenovich/runkit/runkit-1.0.3.tgz'
  sha1 'f0d0c8b0451666dcfdc5250abeff5622aedf3926'
  head 'https://github.com/zenovich/runkit.git'

  def install
    Dir.chdir "runkit-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/runkit.so"
    write_config_file unless build.include? "without-config-file"
  end
end

