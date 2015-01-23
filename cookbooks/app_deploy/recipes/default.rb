#
# Cookbook Name:: app_deploy
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# Ensure apt-cache is up to date
include_recipe 'apt::default'

# Configure MySQL
mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  initial_root_password node['mysql']['initial_root_password']
  action [:create, :start]
end

# Create the database instance
mysql_database 'random_images_db' do
  connection({
    :host => '127.0.0.1',
    :username => 'root',
    :password => node['mysql']['initial_root_password']
  })
  action :create
end

