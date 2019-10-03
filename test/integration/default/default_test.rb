# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_running }
end

describe service('httpd') do
  it { should be_enabled }
end

describe file('/var/www/html/index.html') do
  it { should exist }
end
