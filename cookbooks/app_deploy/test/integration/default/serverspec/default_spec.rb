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

describe command("echo 'SHOW SCHEMAS;' | /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -plearnchef | grep random_images_db") do
  its(:exit_status) { should eq 0 }
end

describe command("echo 'select User,Host from mysql.user;' | /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -plearnchef | grep root") do
  its(:exit_status) { should eq 0 }
end

