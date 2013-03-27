class tmux {
  $tmux_rpm = "http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
  
  package { "tmux":
    require => "tmux_rpm",
  }
  
  exec { "tmux_rpm" :
    command => "/bin/rpm --import ${tmux_rpm}",
    path    => $path,
  }
}
