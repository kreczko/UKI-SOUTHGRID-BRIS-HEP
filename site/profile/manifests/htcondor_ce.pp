class profile::htcondor_ce {
  $uid_domain     = hiera('htcondor::uid_domain', $::domain)
  $managers       = hiera('htcondor::managers', [])
  $pool_collector = join($managers, ',')
  $argus_server   = $::site_info['argus_server']
  $argus_port     = $::site_info['argus_port']
  $supported_vos  = $::site_info['supported_vos']

  class { '::htcondor_ce':
    pool_collector => $pool_collector,
    uid_domain     => $uid_domain,
    argus_server   => $argus_server,
    argus_port     => $argus_port,
    supported_vos  => $supported_vos,
  }
}
