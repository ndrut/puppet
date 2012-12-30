class nginx {
	file { 'nginx.repo':
		path 		=> '/etc/yum.repos.d/nginx.repo',
		ensure 	=> file,
		source 	=> "puppet:///modules/nginx/nginx.repo",
	}
	package { 'nginx':
		ensure 		=> installed,
		require 	=> File['nginx.repo'],
	}
	service { 'nginx':
		ensure 			=> running,
		enable 			=> true,
		hasrestart 	=> true,
		hasstatus 	=> true,
		require			=> Package['nginx'],
	}
}
