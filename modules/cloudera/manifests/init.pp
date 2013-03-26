class cloudera{
  $cloudera_version = "cloudera-cdh-4-0.x86_64"
  $cloudera_url = "http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/${cloudera_version}.rpm"

  exec { "download cloudera":
    command => "wget -O /tmp/${cloudera_version}.rpm ${cloudera_url}",
    path    => $path,
    unless  => "ls /tmp | grep ${cloudera_version}.rpm"
  }
}
