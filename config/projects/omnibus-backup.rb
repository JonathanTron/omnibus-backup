name "omnibus-backup"
maintainer "jonathan@openhood.com"
homepage "http://openhood.com"

install_path    "/opt/omnibus-backup"
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency "preparation"

# version manifest file
dependency "version-manifest"

# backup dependencies/components
dependency "backup"

exclude "\.git*"
exclude "bundler\/git"
