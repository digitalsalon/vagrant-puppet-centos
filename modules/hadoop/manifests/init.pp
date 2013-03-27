class hadoop {
  $hadoop_home = "/etc/hadoop"

  package { ["hadoop-hdfs"]:
    ensure => "installed"
  }

  file { "slaves":
    path    => "${hadoop_home}/conf/slaves",
    source  => "puppet:///modules/hadoop/slaves",
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }

  file { "masters":
    path    => "${hadoop_home}/conf/masters",
    source  => "puppet:///modules/hadoop/masters",
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }

  file { "core-site.xml":
    path    => "${hadoop_home}/conf/core-site.xml",
    source  => "puppet:///modules/hadoop/core-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }

  file { "mapred-site.xml":
    path    => "${hadoop_home}/conf/mapred-site.xml",
    source  => "puppet:///modules/hadoop/mapred-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }

  file { "hdfs-site.xml":
    path    => "${hadoop_home}/conf/hdfs-site.xml",
    mode    => 644,
    owner   => root,
    group   => root,
    content => template("hadoop/hdfs-site.xml.erb"),
    replace => true,
    require => Package["hadoop-hdfs"],
  }

  file { "hadoop-env.sh":
    path    => "${hadoop_home}/conf/hadoop-env.sh",
    source  => "puppet:///modules/hadoop/hadoop-env.sh",
    mode    => 644,
    owner   => root,
    group   => root,
    replace => true,
    require => Package["hadoop-hdfs"]
  }
}
