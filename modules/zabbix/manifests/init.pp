class zabbix {
#	----------------------------------------
#
#	Install the EPEL Repository.
#
# ----------------------------------------

file { 'epel.repo':
	path	=>	'/etc/yum.repos.d/epel.repo',
	ensure	=>	present,
	source	=>	"puppet:///modules/zabbix/epel.repo",
}

}
