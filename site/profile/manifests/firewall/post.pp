class profile::firewall::post {
  # after pre, before custom rules
  firewall { '199 Reject anything else - IPv6':
    chain    => 'FORWARD',
    proto    => 'all',
    action   => 'reject',
    reject   => 'icmp6-adm-prohibited',
    before   => undef,
    provider => 'ip6tables',
  }

  firewall { '199 Reject anything else':
    chain    => 'FORWARD',
    proto    => 'all',
    action   => 'reject',
    reject   => 'icmp-host-prohibited',
    before   => undef,
    provider => 'iptables',
  }

  # after everything
  firewall { '19997 Log once all DROPs are done':
    proto      => 'all',
    jump       => 'LOG',
    log_prefix => '[iptables]: ',
    before     => undef,
    provider   => ['iptables', 'ip6tables'],
  }

  firewall { '19998 Reject anything else - IPv6':
    proto    => 'all',
    action   => 'reject',
    reject   => 'icmp6-adm-prohibited',
    before   => undef,
    provider => 'ip6tables',
  }

  firewall { '19998 Reject anything else':
    proto    => 'all',
    action   => 'reject',
    reject   => 'icmp-host-prohibited',
    before   => undef,
    provider => 'iptables',
  }

}
