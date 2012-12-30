class standard {

#####################################################################
#																																		
#		Default Config																
#																																	
#####################################################################

	file { ['/root/', '/root/.ssh']:
		ensure 		=> directory,
	}

	file { 'authorized_keys':
		ensure 		=> present,
		path 			=> '/root/.ssh/authorized_keys',
		mode 			=> 600,
		force 		=> true,
		source 		=> "puppet:///modules/standard/authorized_keys",
	}

#####################################################################
#																																				
#		VIM Config																		
#																																		
#####################################################################

	package { 'vim-enhanced':
		ensure 		=> installed,
	}

	file { '.vimrc':
		path 			=> '/root/.vimrc',
		ensure 		=> file,
		require 	=> Package['vim-enhanced'],
		source 		=> "puppet:///modules/standard/vimrc",
	}

#####################################################################
#																																		
#		Puppet Agent Config														
#																																		
#####################################################################

	file { 'puppet.conf':
		path 				=>	'/etc/puppet/puppet.conf',
		ensure			=>	file,
		source			=>	"puppet:///modules/standard/puppet.conf",
	}

	service { 'puppet':
		enable 			=> true,
		ensure 			=> running,
		hasrestart	=>	true,
		hasstatus		=>	true,
		subscribe 	=> File['puppet.conf'],
	}

#####################################################################
#
#		Bash Prompt Config														#
#
#####################################################################

	file { '.bashrc':
		path			=> '/root/.bashrc',
		ensure		=> file,
		source		=> "puppet:///modules/standard/bashrc",
	}

	notify { 'BashRC has been loaded.':
		require		=> File['.bashrc'],
	}

#####################################################################
#
#		Configure sysstat (sar)											
#																															
#####################################################################

	package { 'sysstat':
		ensure 		=> installed,
	}

#####################################################################
#
#		End of file													
#
#####################################################################
}
