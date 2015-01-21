#
# Cookbook Name:: app_deploy
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'apache2::default'
include_recipe 'apache2::mod_wsgi'
