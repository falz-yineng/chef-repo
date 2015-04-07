#
# Cookbook Name:: php-src-install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# パッケージインストールされているPHPを削除する
package 'php' do
  action :remove
end

#PHP の実行に必要なパッケージをインストールする
node['php-src-install']['required_packages'].each do |pkg|
  package pkg
end

# ソースの Tarball をキャッシュディレクトリにダウンロードする
php_tarball = node['php-src-install']['tarball']
remote_file "#{Chef::Config[:file_cache_path]}/#{php_tarball}" do
  source node['php-src-install']['url']
  action :create_if_missing
end

# ソースからインストール
options = node['php-src-install']['complile_options'].join(" ")
script "install_php_from_compiled_source" do
  user 'root'
  group 'root'
  interpreter 'bash'
  code <<-EOH
    cd #{Chef::Config[:file_cache_path]}
    tar xzf #{php_tarball}
    cd php-#{node['php-src-install']['version']}
    ./configure #{options}
    make
    make install
  EOH
  not_if "php -v | grep #{node['php-src-install']['version']}"
end
