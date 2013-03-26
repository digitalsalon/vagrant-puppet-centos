class cloudera{
  $cloudera_version = "cloudera-cdh-4-0.x86_64"
  $cd4 = "http://archive.cloudera.com/cdh4"
  $cloudera_url = "${cd4}/one-click-install/redhat/6/x86_64/${cloudera_version}.rpm"
  $cloudera_rpm = "${cd4}/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera"

  exec { "download_cloudera":
    command => "wget -O /tmp/${cloudera_version}.rpm ${cloudera_url}",
    path    => $path,
    unless  => "ls /tmp | grep ${cloudera_version}.rpm"
  }

  #todo: figure out how to use package to install a local RPM
  exec { "install_cloudera":
    command => "/usr/bin/yum -d 0 -e 0 -y --nogpgcheck localinstall /tmp/${cloudera_version}.rpm",
    path    => $path,
    require => Exec["download_cloudera"],
  }

  exec { "cloudera_rpm_gpg_key":
    command => "/bin/rpm --import ${cloudera_rpm}",
    path    => $path,
    require => Exec["install_cloudera"],
  }
}
