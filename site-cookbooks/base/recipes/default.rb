#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# パッケージをインストールする
package node['base']['packages']

# レシピをインクルードする
node['base']['recipes'].each do |recipe|
  include_recipe recipe
end
