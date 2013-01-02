class zabbix::agent {
	file { 'epel.repo':
		path	=>	'/etc/yum.repos.d/epel.repo',
		ensure	=>	present,
		source	=>	"puppet:///modules/zabbix/epel.repo",
	}
	package { 'zabbix20-agent':
		ensure	=>	installed,
		require => File['epel.repo'],
	}
	file { 'zabbix_agentd.conf':
		path	=>	'/etc/zabbix/zabbix_agentd.conf',
		ensure	=>	present,
		require	=>	Package['zabbix20-agent'],
		content =>	template('zabbix/zabbix_agentd.conf.erb'),
	}
}
