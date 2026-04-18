
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
  'exuberant-ctags',
  'flex',
  'git',
  'jq',
  'language-pack-ja',
  'libevent-dev',
  'liblzo2-dev',
  'libncurses5-dev',
  'libpam-dev',
  'libssl-dev',
  'lzop',
  'mosh',
  'nkf',
  'openssl',
  'protobuf-compiler',
  'python3-venv',
  'ruby',
  'silversearcher-ag',
  'socat',
  'software-properties-common',
  'sqlite3',
  'ufw',
  'unzip',
  'wget',
  'zip',
  'zsh',
].each do |pkg|
  package pkg
end

execute 'localedef' do
  user 'root'
  command 'localedef -f UTF-8 -i ja_JP ja_JP.UTF-8'
end

file '/etc/localtime' do
  user 'root'
  action :delete
end
link '/etc/localtime' do
  user 'root'
  to '/usr/share/zoneinfo/Japan'
end

execute 'nvim' do
  arch = `uname -m`.strip
  case arch
  when "x86_64"
    arch = "x86_64"
  when "aarch64", "arm64"
    arch = "arm64"
  end
  dir = "nvim-linux-#{arch}"
  tgz = "#{dir}.tar.gz"
  url = "https://github.com/neovim/neovim/releases/latest/download/#{tgz}"

  not_if 'which nvim'

  user 'root'
  command <<-CMD
cd /tmp
wget #{url} -O #{tgz}
tar xf #{tgz}
cp -a #{dir}/. /usr/local/
  CMD
end

execute 'tig' do
  version = '2.5.4'
  dir = "tig-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "https://github.com/jonas/tig/releases/download/#{dir}/#{tgz}"

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
  version = '3.6a'
  dir = "tmux-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "https://github.com/tmux/tmux/releases/download/#{version}/#{tgz}"

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
