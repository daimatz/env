execute 'install nodebrew' do
  user node[:name]
  command 'curl -sL git.io/nodebrew | perl - setup'
  not_if 'which nodebrew'
end

execute 'install nodejs' do
  version = '8.10.0'
  user node[:name]
  command <<-CMD
#{node[:home]}/.nodebrew/current/bin/nodebrew install-binary #{version}
#{node[:home]}/.nodebrew/current/bin/nodebrew use #{version}
#{node[:home]}/.nodebrew/current/bin/nodebrew alias default #{version}
  CMD
end
