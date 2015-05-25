# == Class: ganglia::web::install
#
# installs the package that provides the ganglia web front end
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::web::install {

  if ($operatingsystem == 'RedHat' or $operatingsystem == 'CentOS') and $operatingsystemmajrelease == '7' {
    $install_options = [ '--enablerepo=epel-testing' ]
  } else {
    $install_options = []
  }



  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $::ganglia::params::web_package_name:
      ensure        => present,
      allow_virtual => false,
      install_options => $install_options,
    }
  } else {
    package { $::ganglia::params::web_package_name:
      ensure => present,
      install_options => $install_options,
    }
  }
}
