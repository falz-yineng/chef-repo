#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# パッケージをインストールする
node['base']['packages'].each do |pkg|
  package pkg
end
