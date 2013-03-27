class hbase {
  $hbase_home = "/etc/hbase"

  package { ["hbase"]:
    ensure => "installed"
  }
}
