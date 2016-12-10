
execute 'add user' do
  user 'root'
  command "useradd -m #{node[:name]}"
  not_if "grep #{node[:name]} /etc/passwd"
end

execute 'sudo without password' do
  user 'root'
  command "echo '#{node[:name]} ALL=(ALL:ALL)NOPASSWD:ALL' >> /etc/sudoers"
  not_if "grep -E ^#{node[:name]} /etc/sudoers"
end

directory 'add ssh dir' do
  user 'root'
  action :create
  path "#{node[:home]}/.ssh"
  mode "700"
  owner node[:name]
  group node[:name]
end

execute 'add ssh keys' do
  user 'root'
  command <<-CMD
    curl https://github.com/daimatz.keys > #{node[:home]}/.ssh/authorized_keys &&
    chown #{node[:name]}:#{node[:name]} #{node[:home]}/.ssh/authorized_keys &&
    chmod 600 #{node[:home]}/.ssh/authorized_keys
  CMD
end
