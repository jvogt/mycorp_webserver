# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'mycorp_webserver'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'mycorp_webserver::default', 'audit::default'

# Specify a custom source for a single cookbook:
cookbook 'mycorp_webserver', path: '.'

default['audit']['reporter'] = 'chef-server-automate'
default['audit']['fetcher'] = 'chef-server'

default['audit']['profiles']['mycorp_webserver'] = {
  'compliance': 'admin/mycorp_webserver',
}
