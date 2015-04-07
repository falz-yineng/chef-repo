#
# Cookbook Name:: git_src_install
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'git' do
	action :remove
end

node['git_src_install']['dependent_packages'].each do |pkg|
	package pkg
end


remote_file "#{Chef::Config[:file_cache_path]}/git-#{node['git_src_install']['version']}.tar.gz" do
	source node['git_src_install']['url']
	checksum node['git_src_install']['checksum']
end

compile_options = node['git_src_install']['compile_options'].join(' ')
execute "build git from source" do
	cwd Chef::Config[:file_cache_path]
	command <<-EOF
		tar xfz git-#{node['git_src_install']['version']}.tar.gz
		cd git-#{node['git_src_install']['version']}
		./configure #{compile_options} && make && make install
	EOF
end
