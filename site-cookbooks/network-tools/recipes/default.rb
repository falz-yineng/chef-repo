#
# Cookbook Name:: network-tools
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node['network-tools']['packages'].each do |pkg|
	package pkg
end
