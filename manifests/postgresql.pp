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
) {

  postgresql::server::db { $database_name:
    user     => $database_username,
    password => $database_password,
    grant    => 'all',
  }

}
