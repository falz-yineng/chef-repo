default['git_src_install']['version'] = '2.3.5'
default['git_src_install']['url'] = "https://www.kernel.org/pub/software/scm/git/git-#{default['git_src_install']['version']}.tar.gz"
default['git_src_install']['checksum'] = 'ab88b66b71bcf1918d57f2cb9d4f4763a63d6628c8c69ab331ba77263da1f096'
default['git_src_install']['compile_options'] = %w{ }
default['git_src_install']['dependent_packages'] = %w{
	libcurl-devel
	perl-ExtUtils-MakeMaker
	gettext
}
