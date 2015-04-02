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
default['ruby-src-install']['version'] = '2.1.5'
default['ruby-src-install']['major_version'] = default['ruby-src-install']['version'].split('.')[0..1].join('.')
default['ruby-src-install']['url'] = "http://cache.ruby-lang.org/pub/ruby/#{default['ruby-src-install']['major_version']}"
default['ruby-src-install']['checksum'] = '5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27a'
