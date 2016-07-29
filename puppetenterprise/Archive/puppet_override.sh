#!/bin/bash
cat <<EOF >/tmp/puppet_override.answers
azure_externalFQDN=parameters('fqdn')
azure_internalFQDN=$(hostname -f)
q_database_host=${azure_externalFQDN}
q_puppet_enterpriseconsole_master_hostname=${azure_externalFQDN}
q_puppet_enterpriseconsole_smtp_host=${azure_externalFQDN}
q_puppetagent_certname=${azure_externalFQDN}
q_puppetmaster_dnsaltnames=puppet,${azure_internalFQDN},${azure_externalFQDN}
q_puppetagent_server=${azure_externalFQDN}
q_puppetdb_hostname=${azure_externalFQDN}
q_puppetmaster_certname=${azure_externalFQDN}
EOF
chmod +x /tmp/puppet_override.answers
