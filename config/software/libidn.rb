name "libidn"
default_version "1.28"

source :url => "http://ftp.gnu.org/gnu/libidn/libidn-#{version}.tar.gz",
       :md5 => "43a6f14b16559e10a492acc65c4b0acc"

relative_path "libidn-#{version}"

env = {
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
end
