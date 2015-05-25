# == Class: ganglia::gmetad::install
#
# installs the package that provides gmetad
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad::install {

  if ($operatingsystem == 'RedHat' or $operatingsystem == 'CentOS') and $operatingsystemmajrelease == '7' {
    $install_options = [ '--enablerepo=epel-testing' ]
  } else {
    $install_options = []
  }

  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $::ganglia::params::gmetad_package_name:
      ensure        => present,
      allow_virtual => false,
      install_options => $install_options,
    }
  } else {
    package { $::ganglia::params::gmetad_package_name:
      ensure          => present,
      install_options => [ '--enablerepo=epel-testing' ],
    }
  }
}
