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

