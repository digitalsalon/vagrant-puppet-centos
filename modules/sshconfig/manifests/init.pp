class sshconfig{
  file { "/root/.ssh":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => 600,
  }

  file { "/root/.ssh/id_rsa":
    source => "puppet:///modules/sshconfig/id_rsa",
    mode => 600,
    owner => root,
    group => root,
  }

  file { "/root/.ssh/id_rsa.pub":
    source => "puppet:///modules/sshconfig/id_rsa.pub",
    mode => 644,
    owner => root,
    group => root,
  }

  ssh_authorized_key { "ssh_key":
    ensure => "present",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCeHdBPVGuSPVOO+n94j/Y5f8VKGIAzjaDe30hu9BPetA+CGFpszw4nDkhyRtW5J9zhGKuzmcCqITTuM6BGpHax9ZKP7lRRjG8Lh380sCGA/691EjSVmR8krLvGZIQxeyHKpDBLEmcpJBB5yoSyuFpK+4RhmJLf7ImZA7mtxhgdPGhe6crUYRbLukNgv61utB/hbre9tgNX2giEurBsj9CI5yhPPNgq6iP8ZBOyCXgUNf37bAe7AjQUMV5G6JMZ1clEeNPN+Uy5Yrfojrx3wHfG40NuxuMrFIQo5qCYa3q9/SVOxsJILWt+hZ2bbxdGcQOd9AXYFNNowPayY0BdAkSr",
    type   => "ssh-rsa",
    user   => "root",
    require => File['/root/.ssh/id_rsa.pub']
  }
}
