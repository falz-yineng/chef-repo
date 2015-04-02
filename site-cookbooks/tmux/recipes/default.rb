#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#  パッケージを削除する
package 'tmux' do
	action :remove
end

# libevent 2.0系をインストールする
tarball = "libevent-#{node['tmux']['libevent']['full_version']}.tar.gz"
remote_file "#{Chef::Config['file_cache_path']}/#{tarball}" do
	source node['tmux']['libevent']['download_url']
	mode '0644'
	not_if {File.exists?("#{Chef::Config['file_cache_path']}/#{tarball}")}
end
execute "Installing libevent-#{node['tmux']['libevent']['full_version']}" do
	cwd Chef::Config['file_cache_path']
	command <<-COMMAND
		tar xfz #{tarball}
		cd 	libevent-#{node['tmux']['libevent']['full_version']}
		./configure && make && make install
	COMMAND
end

remote_file "#{Chef::Config['file_cache_path']}/tmux-#{node['tmux']['version']}.tar.gz" do
	source node['tmux']['download_url']
	mode '0644'
	not_if {File.exists?("#{Chef::Config['file_cache_path']}/tmux-#{node['tmux']['version']}.tar.gz")}
end

execute "Installing tmux-#{node['tmux']['version']}" do
	cwd Chef::Config['file_cache_path']
	command <<-COMMAND
		tar xfz tmux-#{node['tmux']['version']}.tar.gz
		cd tmux-#{node['tmux']['version']}
		./configure && make && make install
	COMMAND
	environment (node['tmux']['compile_options'])
end
