name "backup"
default_version "4.3.0"

dependency "ruby"
dependency "rubygems"
dependency "gnupg"
dependency "nokogiri"

build do
  gem "install backup -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
  delete "#{install_dir}/embedded/docs"
  delete "#{install_dir}/embedded/share/man"
  delete "#{install_dir}/embedded/share/doc"
  delete "#{install_dir}/embedded/ssl/man"
  delete "#{install_dir}/embedded/info"
  delete "#{install_dir}/embedded/lib/ruby/gems/2.1.0/doc/*"
  delete "#{install_dir}/embedded/lib/ruby/gems/2.1.0/cache/*"
end
