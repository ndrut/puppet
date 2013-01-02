node default {
	include standard
	include ntp
}
node 'sidius.tyne.io' inherits default {
	include zabbix::agent
}
