package { 'nginx':
    name    => 'nginx-light',
    ensure  => installed,
}

file { 'www':
    ensure  => directory,
    path    => '/usr/share/nginx/www',
    source  => '/etc/puppet/private/www',
    recurse => true,
    require => Package['nginx'],
}

service { 'nginx':
    ensure  => running,
    enable  => true,
    require => File['www'],
}
