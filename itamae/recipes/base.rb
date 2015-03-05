
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
  'mercurial',
  'ncurses-dev',
  'nkf',
  'ntp',
  'realpath',
  'ruby2.0',
  'silversearcher-ag',
  'software-properties-common',
  'sqlite',
  'tig',
  'tmux',
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
  file to do
    user 'root'
    mode '755'
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

execute 'gnu global' do
  version = '6.3.4'
  user 'root'
  command <<CMD
cd /tmp
wget http://tamacom.com/global/global-#{version}.tar.gz
tar xf global-*
cd global-*
./configure && make && make install
CMD
  not_if 'which global'
end
