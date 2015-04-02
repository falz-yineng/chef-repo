default['tmux']['version'] = '1.9a'
default['tmux']['download_url'] = "http://sourceforge.net/projects/tmux/files/tmux/tmux-1.9/tmux-#{default['tmux']['version']}.tar.gz/download?source=files"

default['tmux']['compile_options'] = {
	LIBEVENT_CFLAGS: '-I/usr/local/include',
	LIBEVENT_LIBS: '-L/usr/local/lib -Wl,-rpath=/usr/local/lib -levent'
}

default['tmux']['libevent']['major_version'] = '2.0'
default['tmux']['libevent']['full_version'] = "#{default['tmux']['libevent']['major_version']}.22-stable"
default['tmux']['libevent']['download_url'] = "https://sourceforge.net/projects/levent/files/libevent/libevent-#{default['tmux']['libevent']['major_version']}/libevent-#{default['tmux']['libevent']['full_version']}.tar.gz"
