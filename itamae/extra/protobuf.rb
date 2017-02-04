execute 'protobuf' do
  version = '2.6.1'
  dir = "protobuf-#{version}"
  tgz = "#{dir}.tar.gz"
  url = "https://github.com/google/protobuf/releases/download/v#{version}/#{tgz}"

  not_if 'which protoc'

  user 'root'
  command <<-CMD
cd /tmp
wget #{url} -O #{tgz}
tar xf #{tgz}
cd #{dir}
./configure && make && make install
ldconfig
  CMD
end
