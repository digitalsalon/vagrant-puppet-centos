class hadoop {
  $hadoop_home = "/etc/hadoop"

  package { ["hadoop-hdfs"]:
    ensure => "installed"
  }

  file { "slaves":
    path    => "${hadoop_path}/conf/slaves",
    source  => "puppet:///modules/hadoop/slaves",
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package["hadoop-hdfs"]
  }

  file { "masters":
    path    => "${hadoop_path}/conf/masters",
    source  => "puppet:///modules/hadoop/masters",
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package["hadoop-hdfs"]
  }

  file { "core-site.xml":
    path    => "${hadoop_path}/conf/core-site.xml",
    source  => "puppet:///modules/hadoop/core-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package["hadoop-hdfs"]
  }

  file { "mapred-site.xml":
    path    => "${hadoop_path}/conf/mapred-site.xml",
    source  => "puppet:///modules/hadoop/mapred-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package["hadoop-hdfs"]
  }

  file { "hdfs-site.xml":
    path    => "${hadoop_path}/conf/hdfs-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    content => template("hadoop/hdfs-site.xml.erb"),
    require => Package["hadoop-hdfs"],
  }

  file { "hadoop-env.sh":
    path    => "${hadoop_path}/conf/hadoop-env.sh",
    source  => "puppet:///modules/hadoop/hadoop-env.sh",
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package["hadoop-hdfs"]
  }
}
