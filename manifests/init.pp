# Class: repo_nginx
#
# This module manages repo_nginx
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage: include repo_nginx
#
class repo_nginx () inherits repo_nginx::params {

  if $::osfamily == 'RedHat' {
    include repo_nginx::nginx

    repo_nginx::rpm_gpg_key{ "RPM-GPG-KEY-nginx":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx",
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx":
      ensure => present,
      owner  => 0,
      group  => 0,
      mode   => '0644',
      source => "puppet:///modules/repo_nginx/RPM-GPG-KEY-nginx",
    }

  } else {
      notice ("Your operating system ${::operatingsystem} is not supported for nginx repositories")
  }

}
