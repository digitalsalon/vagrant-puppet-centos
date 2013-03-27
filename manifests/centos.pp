$java_home = "/usr/lib/jvm/jre-openjdk"

class{'cloudera': }
class{'java': } -> class{'hbase': java_home =>  $java_home} -> class{'hadoop': java_home =>$java_home}
class{'sshconfig': }
class{'tmux': }
