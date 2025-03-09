directory node[:gopath]

execute "download & unarchive" do
  url = 'https://dl.google.com/go/go1.24.1.linux-amd64.tar.gz'
  dir = File.dirname(node[:goroot])
  command "curl -L #{url} | tar -xz -C #{dir} && mv #{dir}/go #{node[:goroot]}"
  not_if "test -f #{node[:goroot]}/bin/go"
end

package 'peco'

[
  'github.com/x-motemen/ghq@latest',
  'github.com/golang/protobuf/protoc-gen-go@latest',
].each do |pkg|
  execute "go get #{pkg}" do
    command "GOROOT=#{node[:goroot]} GOPATH=#{node[:gopath]} #{node[:goroot]}/bin/go install #{pkg}"
    not_if "test -d #{node[:gopath]}/src/#{pkg}"
  end
end
