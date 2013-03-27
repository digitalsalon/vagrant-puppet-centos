class hbase($java_home) {
  $hbase_home = "/etc/hbase"

  package { ["hbase"]:
    ensure => "installed"
  }

  file { "hadoop-env.sh":
    path    => "${hbase_home}/conf/hbase-env.sh",
    content => template("hbase/hbase-env.sh.erb"),
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hbase"]
  }
}
