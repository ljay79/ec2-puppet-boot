package { 'nginx':
    name    => 'nginx-light',
    ensure  => installed,
}

service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}

file { 'www':
    ensure  => directory,
    path    => '/usr/share/nginx/www',
    source  => '/etc/puppet/private/www',
    recurse => true,
}
