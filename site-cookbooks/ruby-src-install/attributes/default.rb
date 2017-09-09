default['ruby-src-install']['required_packages'] = %w{
	autoconf
	openssl-devel
	libyaml-devel
	readline-devel
	procps
	curl-devel
	zlib-devel
}
default['ruby-src-install']['configure_options'] = %w{ }
default['ruby-src-install']['version'] = '2.4.1'
default['ruby-src-install']['major_version'] = default['ruby-src-install']['version'].split('.')[0..1].join('.')
default['ruby-src-install']['url'] = "http://cache.ruby-lang.org/pub/ruby/#{default['ruby-src-install']['major_version']}"
default['ruby-src-install']['checksum'] = 'a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250'

default['ruby-src-install']['gem_packages'] = %w{
	bundler
	rspec
}
