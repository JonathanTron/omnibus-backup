name "backup"
default_version "3.11.0"

dependency "ruby"
dependency "rubygems"
dependency "nokogiri"
dependency "gnupg"

build do
  gem "install backup -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
  delete "#{install_dir}/embedded/docs"
  delete "#{install_dir}/embedded/share/man"
  delete "#{install_dir}/embedded/share/doc"
  delete "#{install_dir}/embedded/ssl/man"
  delete "#{install_dir}/embedded/info"
  delete "#{install_dir}/embedded/lib/ruby/gems/1.9.1/doc/*"
end
