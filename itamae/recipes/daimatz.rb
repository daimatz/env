
include_recipe 'base.rb'

template "#{node[:home]}/.ssh/id_rsa" do
  user node[:name]
  source "~/.ssh/id_rsa"
  mode "600"
end

git "#{node[:home]}/dotfiles" do
  user node[:name]
  # repository "git@github.com:daimatz/dotfiles.git"
  repository "https://github.com/daimatz/dotfiles.git"
end

execute "link dotfiles" do
  user node[:name]
  command "#{node[:home]}/dotfiles/linker.sh"
  not_if "test -d #{node[:home]}/.zsh"
end

execute "set login shell" do
  user 'root'
  command "chsh -s /usr/bin/zsh #{node[:name]}"
  not_if "cat /etc/passwd | grep #{node[:name]} | grep zsh"
end

[
  '.ntpd.sh',
  '.zshrc',
].each do |sh|
  template "#{node[:home]}/#{sh}" do
    user node[:name]
    source "../templates/dot#{sh}"
  end
end
