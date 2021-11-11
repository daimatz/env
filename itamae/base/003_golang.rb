directory node[:gopath]

execute "download & unarchive" do
  url = 'https://dl.google.com/go/go1.17.3.linux-amd64.tar.gz'
  dir = File.dirname(node[:goroot])
  command "curl -L #{url} | tar -xz -C #{dir} && mv #{dir}/go #{node[:goroot]}"
  not_if "test -f #{node[:goroot]}/bin/go"
end

execute "for building go" do
  go14 = "#{node[:home]}/go1.4"
  url = 'http://golang.org/dl/go1.4.linux-amd64.tar.gz'
  dir = File.dirname(go14)
  command "curl -L #{url} | tar -xz -C #{dir} && mv #{dir}/go #{go14}"
  not_if "test -f #{go14}/bin/go"
end

package 'peco'

[
  'github.com/x-motemen/ghq',
  'github.com/golang/protobuf/proto',
  'github.com/golang/protobuf/protoc-gen-go',
].each do |pkg|
  execute "go get #{pkg}" do
    command "GOROOT=#{node[:goroot]} GOPATH=#{node[:gopath]} #{node[:goroot]}/bin/go get #{pkg}"
    not_if "test -d #{node[:gopath]}/src/#{pkg}"
  end
end
