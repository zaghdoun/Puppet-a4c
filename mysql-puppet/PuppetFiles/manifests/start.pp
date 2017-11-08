


  exec { "Grant all privileges ${::db_user} on ${::db_name}": 
    #unless => "mysql -uroot -p${::db_password} ${::db_name}",
    path => ["/bin", "/usr/bin"],
    command => "sudo mysql -uroot -p${::db_password} -e \"GRANT ALL PRIVILEGES ON ${::db_name}.* TO '${::db_user}'@'%' WITH GRANT OPTION\"",
  }

  exec { "Flush privileges": 
    #unless => "mysql -uroot -p${::db_password} ${::db_name}",
    path => ["/bin", "/usr/bin"],
    command => "sudo mysql -uroot -p${::db_password} -e \"FLUSH PRIVILEGES\"",
	require => Exec["Grant all privileges ${::db_user} on ${::db_name}"],
  }
