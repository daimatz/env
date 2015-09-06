
include_recipe 'base.rb'

directory node[:gopath]

execute "download & unarchive" do
  url = 'http://golang.org/dl/go1.5.linux-amd64.tar.gz'
  dir = File.dirname(node[:goroot])
  command "curl -L #{url} | tar -xz -C #{dir} && mv #{dir}/go #{node[:goroot]}"
  not_if "test -f #{node[:goroot]}/bin/go"
end

[
  'golang.org/x/tools/cmd/goimports',
  'golang.org/x/tools/cmd/godoc',
  'golang.org/x/tools/cmd/vet',
  'golang.org/x/tools/cmd/cover',
  'github.com/nsf/gocode',
  'github.com/lestrrat/peco/cmd/peco',
  'github.com/motemen/ghq',
].each do |pkg|
  execute "go get #{pkg}" do
    command "GOROOT=#{node[:goroot]} GOPATH=#{node[:gopath]} #{node[:goroot]}/bin/go get #{pkg}"
    not_if "test -d #{node[:gopath]}/src/#{pkg}"
  end
end

include_recipe 'chown.rb'
