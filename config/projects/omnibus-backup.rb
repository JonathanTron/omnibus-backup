name "omnibus-backup"
maintainer "jonathan@openhood.com"
homepage "http://openhood.com"

install_dir "/opt/omnibus-backup"
build_version "3.11.0"
build_iteration 1

# creates required build directories
dependency "preparation"

# version manifest file
dependency "version-manifest"

# backup dependencies/components
dependency "backup"

exclude "**/.git"
exclude "**/bundler/git"
