default['grafana']['install_type'] = 'file' # file | git
default['grafana']['git']['url'] = 'https://github.com/grafana/grafana'
default['grafana']['git']['branch'] = 'master'
default['grafana']['git']['type'] = 'sync' # checkout | sync
default['grafana']['file']['type'] = 'tar.gz' # tar.gz | zip
default['grafana']['file']['version'] = '1.9.1'
default['grafana']['file']['url'] = 'http://grafanarel.s3.amazonaws.com/grafana-%{version}.%{type}'
default['grafana']['file']['checksum'] = 'c328c7a002622f672affbcaabd5e64ae279be1051ee27c62ba22bfed63680508' # sha256 ( shasum -a 256 FILENAME )
default['grafana']['webserver'] = 'nginx'
default['grafana']['install_path'] = '/srv/apps'
default['grafana']['install_dir'] = "#{node['grafana']['install_path']}/grafana"
default['grafana']['admin_password'] = ''

case node['grafana']['install_type']
when 'git'
  default['grafana']['web_dir'] = "#{node['grafana']['install_dir']}/current/src"
when 'file'
  default['grafana']['web_dir'] = node['grafana']['install_dir']
end

# elastic search
default['grafana']['es_server'] = '127.0.0.1'
default['grafana']['es_port'] = '9200'
default['grafana']['es_role'] = 'elasticsearch_server'
default['grafana']['es_scheme'] = 'http://'
default['grafana']['es_user'] = ''
default['grafana']['es_password'] = ''

# graphite
default['grafana']['graphite_server'] = '127.0.0.1'
default['grafana']['graphite_port'] = '80'
default['grafana']['graphite_role'] = 'graphite_server'
default['grafana']['graphite_scheme'] = 'http://'
default['grafana']['graphite_user'] = ''
default['grafana']['graphite_password'] = ''

# webserver
default['grafana']['user'] = ''
default['grafana']['config_template'] = 'config.js.erb'
default['grafana']['config_cookbook'] = 'grafana'
default['grafana']['webserver_hostname'] = node.name
default['grafana']['webserver_aliases'] = [node['ipaddress']]
default['grafana']['webserver_listen'] = node['ipaddress']
default['grafana']['webserver_port'] = 80
default['grafana']['webserver_scheme'] = 'http://'

# config.js
default['grafana']['default_route'] = '/dashboard/file/default.json'
default['grafana']['timezone_offset'] = 'null' # Example: "-0500" (for UTC - 5 hours)
default['grafana']['grafana_index'] = 'grafana-index'
default['grafana']['unsaved_changes_warning'] = 'true'
default['grafana']['playlist_timespan'] = '1m'
default['grafana']['window_title_prefix'] = 'Grafana - '
default['grafana']['search_max_results'] = 20
