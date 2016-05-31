# Class: activemq::postgresql
#
# == Usage
#
# This class is not intended to be used directly.
#
class activemq::postgresql (
  $database_name        = 'jmx',
  $database_username    = 'jmx',
  $database_password    = 'jmx',
) inherits activemq {

  postgresql::server::db { $database_name:
    user     => $database_username,
    password => $database_password,
    grant    => 'all',
  }

  $str = "## activemq database settings
          db.host=localhost
          db.port=5432
          db.name=${database_name}
          db.user=a${database_username}
          db.passwd=${database_password}
          db.pool.maxActive=10
          "

  file { "${real_config_dir}/activemq.properties":
    content => $str,
  }

}
