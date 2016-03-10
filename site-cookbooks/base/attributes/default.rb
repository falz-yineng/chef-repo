default['base']['packages'] = %w{
  sysstat
  autoconf
  strace
  zip
  unzip
  htop
  nkf
  xz
}

default['base']['recipes'] = %w{
  yum-epel
  yum-remi-chef::remi
}
