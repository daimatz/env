execute 'protobuf' do
  version = '3.11.2'
  dir = "protoc-#{version}-linux-x86_64"
  zip = "#{dir}.zip"
  url = "https://github.com/protocolbuffers/protobuf/releases/download/v#{version}/#{zip}"

  not_if 'which protoc'

  user 'root'
  command <<-CMD
cd /tmp/$(mktemp XXXXX)
wget #{url} -O #{zip}
unzip #{zip}
mkdir -p /usr/local/include/google/protobuf/ /usr/local/bin/
cp -r include/google/protobuf/* /usr/local/include/google/protobuf/
cp bin/protoc /usr/local/bin/
  CMD
end
