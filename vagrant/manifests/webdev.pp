$ar_databases = ['activerecord_unittest', 'activerecord_unittest2']
$as_vagrant   = 'sudo -u vagrant -H bash -l -c'
$home         = '/home/vagrant'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

group { 'puppet':
  ensure => 'present'
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
  timeout => 0
} ->


# --- Packages -----------------------------------------------------------------

package { 'build-essential':
  ensure => installed,
  require => Exec['apt-get update']
}

package { 'git':
  ensure => installed,
  require => Package['build-essential']
}

package { 'git-core':
  ensure => installed,
  require => Package['git']
}

# Nokogiri dependencies.
package { ['libxml2', 'libxml2-dev', 'libxslt1-dev']:
  ensure => installed,
  require => Package['git-core']
}

# ExecJS runtime.
package { 'nodejs':
  ensure => installed,
  require => Package['git-core']
}

# vim.
package { 'vim':
  ensure => installed,
  require => Package['nodejs']
}


package { 'curl':
  ensure => installed,
  require => Package['libmysqlclient15-dev']
}



# --- Ruby ---------------------------------------------------------------------

exec { 'install_rvm':
  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable'",
  creates => "${home}/.rvm/bin/rvm",
  require => Package['curl']
}

exec { 'install_ruby':
  # We run the rvm executable directly because the shell function assumes an
  # interactive environment, in particular to display messages or ask questions.
  # The rvm executable is more suitable for automated installs.
  #
  # Thanks to @mpapis for this tip.
  command => "${as_vagrant} '${home}/.rvm/bin/rvm install 1.9.3 && rvm --fuzzy alias create default 1.9.3'",
  creates => "${home}/.rvm/bin/ruby",
  require => Exec['install_rvm']
}

exec { "${as_vagrant} 'gem install bundler --no-rdoc --no-ri'":
  creates => "${home}/.rvm/bin/bundle",
  require => Exec['install_ruby']
}
