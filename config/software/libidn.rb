name "libidn"
default_version "1.30"

source :url => "http://ftp.gnu.org/gnu/libidn/libidn-#{version}.tar.gz",
       :md5 => "b17edc8551cd31cc5f14c82a9dabf58e"

relative_path "libidn-#{version}"

env = {
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", :env => env
  command "make -j #{workers}", :env => env
  command "make install", :env => env
end
