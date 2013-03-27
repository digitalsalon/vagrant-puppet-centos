class hadoop {
  $hadoop_home = "/etc/hadoop"

  $slaves = ['192.168.0.12', '192.168.0.13', '192.168.0.14']
  $masters = ['192.168.0.11']

  package { ["hadoop-hdfs"]:
    ensure => "installed"
  }

  file { "slaves":
    path    => "${hadoop_home}/conf/slaves",
    content => template("hadoop/slaves.erb"),
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }

  file { "masters":
    path    => "${hadoop_home}/conf/masters",
    content => template("hadoop/masters.erb"),
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }
  # file { "core-site.xml":
  #   path    => "${hadoop_home}/conf/core-site.xml",
  #   source  => "puppet:///modules/hadoop/core-site.xml",
  #   mode    => 644,
  #   owner   => root,
  #   group   => root,
  #   replace => true,
  #   require => Package["hadoop-hdfs"]
  # }

  # file { "mapred-site.xml":
  #   path    => "${hadoop_home}/conf/mapred-site.xml",
  #   source  => "puppet:///modules/hadoop/mapred-site.xml",
  #   mode    => 644,
  #   owner   => root,
  #   group   => root,
  #   replace => true,
  #   require => Package["hadoop-hdfs"]
  # }

  # file { "hdfs-site.xml":
  #   path    => "${hadoop_home}/conf/hdfs-site.xml",
  #   mode    => 644,
  #   owner   => root,
  #   group   => root,
  #   content => template("hadoop/hdfs-site.xml.erb"),
  #   replace => true,
  #   require => Package["hadoop-hdfs"],
  # }

  file { "hadoop-env.sh":
    path    => "${hadoop_home}/conf/hadoop-env.sh",
    content => template("hadoop/hadoop-env.sh.erb"),
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }
}
