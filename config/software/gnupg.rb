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
default_version "2.0.27"

source :url => "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-#{version}.tar.bz2",
       :md5 => "b35df68881a5ae432b0391b73773c698"

relative_path "gnupg-#{version}"

dependency "curl"
dependency "readline"
dependency "libassuan"
dependency "libgpg-error"
dependency "libgcrypt"
dependency "libksba"
dependency "pth"

prefix = "#{install_dir}/embedded"

env = {
  "CFLAGS" => "-L#{prefix}/lib -I#{prefix}/include",
  "LD_RUN_PATH" => "#{prefix}/lib",
  "PATH" => "#{prefix}/bin:#{ENV['PATH']}"
}

build do
  command ["./configure",
           "--disable-ldap",
           "--prefix=#{prefix}",
           "--with-libgpg-error-prefix=#{prefix}",
           "--with-libgcrypt-prefix=#{prefix}",
           "--with-libassuan-prefix=#{prefix}",
           "--with-ksba-prefix=#{prefix}",
           "--with-pth-prefix=#{prefix}"
           ].join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install", :env => env
end
