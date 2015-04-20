
execute 'apt update' do
  user 'root'
  command 'apt update'
end

[
  'apt-transport-https',
  'autoconf',
  'bison',
  'build-essential',
  'curl',
  'flex',
  'git',
  # 'global',
  'jq',
  'libevent-dev',
  'libncurses5-dev',
  'mercurial',
  'nkf',
  'ntp',
  'realpath',
  'ruby2.0',
  'silversearcher-ag',
  'software-properties-common',
  'sqlite',
  # 'tig',
  # 'tmux',
  'unzip',
  'vim',
  'wget',
  'zip',
  'zsh',
].each do |pkg|
  package pkg
end

{
  '/usr/bin/diff-highlight' => '/usr/share/doc/git/contrib/diff-highlight/diff-highlight',
  '/usr/bin/git-new-workdir' => '/usr/share/doc/git/contrib/workdir/git-new-workdir',
}.each do |from, to|
  link from do
    user 'root'
    to to
  end
  execute "make executable #{to}" do
    user 'root'
    command "chmod +x #{to}"
    not_if "test -x #{to}"
  end
end

file '/etc/localtime' do
  user 'root'
  action :delete
  not_if 'test -L /etc/localtime'
end
link '/etc/localtime' do
  user 'root'
  to '/usr/share/zoneinfo/Japan'
end

execute 'vboxvideo' do
  user 'root'
  command 'echo vboxvideo >> /etc/modules'
  not_if 'grep vboxvideo /etc/modules'
end

execute 'gnu global' do
  version = '6.3.4'
  dir = "global-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "http://tamacom.com/global/#{tgz}"

  not_if 'which global'

  user 'root'
  command <<-CMD
cd /tmp
wget #{url} -O #{tgz}
tar xf #{tgz}
cd #{dir}
./configure && make && make install
  CMD
end

execute 'tig' do
  version = '2.0.3'
  dir = "tig-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "http://jonas.nitro.dk/tig/releases/#{tgz}"

  not_if 'which tig'

  user 'root'
  command <<-CMD
cd /tmp
wget #{url} -O #{tgz}
tar xf #{tgz}
cd #{dir}
./configure && make && make install
  CMD
end

execute 'tmux' do
  version = '1.9a'
  dir = "tmux-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.9/#{tgz}"

  not_if 'which tmux'

  user 'root'
  command <<-CMD
cd /tmp
wget #{url} -O #{tgz}
tar xf #{tgz}
cd #{dir}
./configure && make && make install
  CMD
end
