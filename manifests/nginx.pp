class repo_nginx::nginx inherits repo_nginx::params {  
  yumrepo { 'nginx':
    baseurl  => "${url}/${urlbit}/${::architecture}",
    descr    => "nginx.org Community Enterprise Linux Repository - el${::os_maj_version} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nginx",
    priority => '11',
  }

}
