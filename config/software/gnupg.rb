# TODO: Remove once https://github.com/opscode/omnibus-software/pull/5 is merged
#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "gnupg"
default_version "2.0.23"

source :url => "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-2.0.23.tar.bz2",
       :md5 => "1c30b3aa1f99f17b4988e1ab616355d4"

relative_path "gnupg-2.0.23"

dependencies ["libgpg-error", "libassuan", "pth", "libksba", "readline", "libgcrypt"]

env = {
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
end
