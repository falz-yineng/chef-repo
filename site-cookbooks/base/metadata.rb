name             'base'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

%w{
  vim
  yum
  yum-epel
  yum-remi-chef
  timezone-ii
}.each do |cookbook|
  depends cookbook
end
