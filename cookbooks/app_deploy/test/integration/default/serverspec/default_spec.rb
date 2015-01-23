require 'serverspec'
set :backend, :exec

describe service("mysql") do
  it { should be_running }
end

describe file("/etc/mysql-default/conf.d") do
  it { should be_directory }
  it { should be_mode 750 }
  it { should be_owned_by 'mysql' }
  it { should be_grouped_into 'mysql' }
end

