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
    content 'Hello World'
end
