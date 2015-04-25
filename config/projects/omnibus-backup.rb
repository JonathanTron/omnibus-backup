name "omnibus-backup"
maintainer "jonathan@openhood.com"
homepage "http://openhood.com"

install_dir "/opt/omnibus-backup"
build_version "4.1.10"
build_iteration 1

# creates required build directories
dependency "preparation"

# version manifest file
dependency "version-manifest"

# backup dependencies/components
override :ruby, version: "2.1.6"
dependency "backup"

exclude "**/.git"
exclude "**/bundler/git"
