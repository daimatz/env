
include_recipe 'base.rb'

execute 'install nodebrew' do
  user node[:name]
  command 'curl -L git.io/nodebrew | perl - setup'
  not_if 'which nodebrew'
end

execute 'install nodejs' do
  version = '4.4.3'
  user node[:name]
  command <<-CMD
/home/dai/.nodebrew/current/bin/nodebrew install-binary #{version}
/home/dai/.nodebrew/current/bin/nodebrew use #{version}
/home/dai/.nodebrew/current/bin/nodebrew alias default #{version}
  CMD
end

include_recipe 'chown.rb'
