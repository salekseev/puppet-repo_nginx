# Optional parameters in setting up NGINX Yum repository
class repo_nginx::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'

  # There are some URL manipulations that have to happen based on exact OS type
  if $::osfamily == 'RedHat' {
    $url = "http://nginx.org/packages/rhel"
    $urlbit = "${::os_maj_version}"
  }
}
