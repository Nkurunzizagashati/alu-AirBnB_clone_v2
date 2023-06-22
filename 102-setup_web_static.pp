# Redo the task #0 but by using Puppet:
class web_static {
  package { 'nginx':
    ensure => installed,
  }

  file { '/data':
    ensure => directory,
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  file { '/data/web_static':
    ensure => directory,
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  file { '/data/web_static/releases':
    ensure => directory,
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  file { '/data/web_static/shared':
    ensure => directory,
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  file { '/data/web_static/releases/test':
    ensure => directory,
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  file { '/data/web_static/releases/test/index.html':
    ensure  => file,
    owner   => 'ubuntu',
    group   => 'ubuntu',
    mode    => '0644',
    content => '<html><body>Test HTML file</body></html>',
  }

  file { '/data/web_static/current':
    ensure => 'link',
    target => '/data/web_static/releases/test',
    owner  => 'ubuntu',
    group  => 'ubuntu',
    mode   => '0755',
  }

  exec { 'restart_nginx':
    command     => '/usr/sbin/service nginx restart',
    refreshonly => true,
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '
server {
    listen 80;
    listen [::]:80 default_server ipv6only=on;
    root /usr/share/nginx/html;
    index index.html index.htm;
    server_name localhost;
    location /hbnb_static {
        alias /data/web_static/current/;
    }
}',
    notify  => Exec['restart_nginx'],
  }
}

include web_static
