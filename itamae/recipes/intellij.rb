
include_recipe 'base.rb'

[
  'xfce4',
  'fonts-vlgothic',
].each do |pkg|
  package pkg
end

execute "download & unarchive" do
  url = 'http://download.jetbrains.com/idea/ideaIC-14.1.4.tar.gz'
  command "curl -L #{url} | tar -xz -C #{node[:home]} && mv #{node[:home]}/idea-IC-* #{node[:home]}/intellij"
  not_if "test -d #{node[:home]}/intellij"
end

include_recipe 'chown.rb'
