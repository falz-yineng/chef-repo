default['php-src-install']['version'] = '5.6.4'
default['php-src-install']['tarball'] = "php-#{default['php-src-install']['version']}.tar.gz"
default['php-src-install']['url'] = "http://jp2.php.net/distributions/#{default['php-src-install']['tarball']}"
default['php-src-install']['complile_options'] = %w{
}
default['php-src-install']['required_packages'] = %w{
  bison
  re2c
  libxml2
  libxml2-devel
}

