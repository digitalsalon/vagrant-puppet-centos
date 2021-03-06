class tmux {
  $tmux_rpm = "http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm"

  exec { "tmux_rpm" :
    command => "/bin/rpm -ivh ${tmux_rpm}",
    path    => $path,
  }

  package { ["tmux"]:
    require => Exec["tmux_rpm"],
  }
}
