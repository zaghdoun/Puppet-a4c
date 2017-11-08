
  exec { "create-${::db_user}": 
    #unless => "mysql -uroot -p${::db_password} ${::db_name}",
    path => ["/bin", "/usr/bin"],
    command => "sudo mysql -uroot -p${::db_password} -e \"CREATE USER '${::db_user}'@'%' IDENTIFIED BY '${::db_password}';\"",
    require => Exec["create-${::db_name}-db"],
  }
  
  exec { "create-${::db_name}-db":
    unless => "sudo mysql -uroot ${::db_name}",
    path => ["/bin", "/usr/bin"],
    command => "sudo mysql -uroot -p${::db_password} -e \"create database ${::db_name};\"",
  }
 