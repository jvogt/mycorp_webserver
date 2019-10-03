#
# Cookbook:: mycorp_webserver
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content "Hello World from #{node.policy_group}"
end

directory '/home/chef'

user 'chef' do
  home '/home/chef'
  manage_home true
  password '$1$WgXqffFX$KeByLO7vY1tUuOFwim7oq0'
end

sudo 'chef' do
  user 'chef'
  nopasswd true
end

service 'sshd' do
  action :nothing
end

execute "sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config" do
  only_if 'grep "^PasswordAuthentication no" /etc/ssh/sshd_config'
  action :run
  notifies :restart, 'service[sshd]', :immediately
end