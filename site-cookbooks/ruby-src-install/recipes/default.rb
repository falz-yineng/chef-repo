#
# Cookbook Name:: ruby-src-install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'ruby' do
	action :remove
end

include_recipe 'build-essential'
node['ruby-src-install']['required_packages'].each do |pkg|
	package pkg
end

version = node['ruby-src-install']['version']
cache_path = Chef::Config[:file_cache_path]

remote_file "#{cache_path}/ruby-#{version}.tar.gz" do
	source "#{node['ruby-src-install']['url']}/ruby-#{version}.tar.gz"
	checksum node['ruby-src-install']['checksum']
	not_if { File.exists?("#{cache_path}/ruby-#{version}.tar.gz") }
end

configure_options = node['ruby-src-install']['configure_options'].join(' ')

execute "build-ruby" do
	command <<-EOF
		cd #{cache_path}
		tar xfz ruby-#{version}.tar.gz 
		cd ruby-#{version}
		./configure #{configure_options} 
		make install
	EOF
	# 同じバージョンがインストールされていたら何もしない
	not_if "ruby -v | grep #{version}"
end

execute "update gem" do
	command "gem update --system"
	action :run
end

node['ruby-src-install']['gem_packages'].each do |gem_pkg|
	gem_package gem_pkg
end
