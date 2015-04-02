#
# Cookbook Name:: phpunit
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log node['phpunit']

phar_file = node['phpunit']['phar']['file']
remote_file "#{Chef::Config[:file_cache_path]}/#{phar_file}" do
  source node['phpunit']['phar']['url']
  action :create_if_missing
end

install_file_name = File.basename(phar_file, '.*')
log install_file_name
bash 'install_phpunit' do
   user 'root'
   group 'root'
   code <<-EOH
      cd #{Chef::Config[:file_cache_path]}
      chmod +x #{phar_file}
      cp -a #{phar_file} #{node['phpunit']['install_dir']}/#{install_file_name}
   EOH
end
