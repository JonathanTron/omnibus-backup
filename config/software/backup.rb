name "backup"
version "3.7.0"

dependency "ruby"
dependency "rubygems"
dependency "nokogiri"
dependency "gnupg"

build do
  gem "install backup -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
  command "rm -rf /opt/backup/embedded/docs"
  command "rm -rf /opt/backup/embedded/share/man"
  command "rm -rf /opt/backup/embedded/share/doc"
  command "rm -rf /opt/backup/embedded/ssl/man"
  command "rm -rf /opt/backup/embedded/info"
end
